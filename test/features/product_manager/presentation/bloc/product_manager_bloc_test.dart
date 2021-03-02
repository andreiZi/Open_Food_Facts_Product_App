import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_test_app/core/error/failures.dart';
import 'package:food_api_test_app/core/util/input_converter.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:food_api_test_app/features/product_manager/domain/usecases/get_product.dart';
import 'package:food_api_test_app/features/product_manager/presentation/bloc/product_manager_bloc.dart';
import 'package:mockito/mockito.dart';

class MockGetOpenItem extends Mock implements GetOpenFoodItem {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  ProductManagerBloc bloc;
  MockGetOpenItem mockGetOpenItem;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetOpenItem = MockGetOpenItem();
    mockInputConverter = MockInputConverter();

    bloc = ProductManagerBloc(
        openFoodItem: mockGetOpenItem, inputConverter: mockInputConverter);
  });

  test('Initial State should be empty', () {
    //assert
    expect(bloc.initialState, equals(Empty()));
  });

  group('get Open Food Item from barcode', () {
    final tBarcodeString = '20035594';
    final tBarcodeNumber = 20035594;
    final tOpenFoodItem = OpenFoodItem(
        status: 1, statusVerbose: 'product found', barCode: 20035594);

    void setUpMockInputConverterSuccess() =>
        when(mockInputConverter.stringToUnsignedInteger(any))
            .thenReturn(Right(tBarcodeNumber));

    void setUpMockInputVonverterFailure() =>
        when(mockInputConverter.stringToUnsignedInteger(any))
            .thenReturn(Left(InvalidInputfailure()));

    test(
        'should call the InputConverter and convert the string to an unsigned integer',
        () async {
      //arrange
      setUpMockInputConverterSuccess();
      //act
      bloc.add(GetOpenFoodItemForBarcode(tBarcodeString));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
      //assert
      verify(mockInputConverter.stringToUnsignedInteger(tBarcodeString));
    });

    test('should emit [Error] when the input is invalid', () async {
      //arrange
      setUpMockInputVonverterFailure();
      //assert later
      final expected = [
        Empty(),
        Error(message: INVALID_INPUT_FAILURE_MESSAGE),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(GetOpenFoodItemForBarcode(tBarcodeString));
    });

    test('should get data from the getOpenFoodItem usecase', () async {
      //arrange
      setUpMockInputConverterSuccess();
      when(mockGetOpenItem(any)).thenAnswer((_) async => Right(tOpenFoodItem));
      //act
      bloc.add(GetOpenFoodItemForBarcode(tBarcodeString));
      await untilCalled(mockGetOpenItem(any));
      //assert
      verify(mockGetOpenItem(Params(barCode: tBarcodeNumber)));
    });

    test('should emit [Loading, Loaded] when the data is gotten succesfully',
        () async {
      //arrange
      setUpMockInputConverterSuccess();
      when(mockGetOpenItem(any)).thenAnswer((_) async => Right(tOpenFoodItem));
      //assert later
      final expected = [
        Empty(),
        Loading(),
        Loaded(openFoodItem: tOpenFoodItem),
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(GetOpenFoodItemForBarcode(tBarcodeString));
    });

    test('should emit [Loading, Error] when getting data fails', () async {
      //arrange
      setUpMockInputConverterSuccess();
      when(mockGetOpenItem(any)).thenAnswer((_) async => Left(ServerFailure()));
      //assert later
      final expected = [
        Empty(),
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE)
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(GetOpenFoodItemForBarcode(tBarcodeString));
    });

    test(
        'should emit [Loading, Error] with a proper message for the error when getting data fails',
        () async {
      //arrange
      setUpMockInputConverterSuccess();
      when(mockGetOpenItem(any)).thenAnswer((_) async => Left(CacheFailure()));
      //assert later
      final expected = [
        Empty(),
        Loading(),
        Error(message: CACHE_FAILURE_MESSAGE)
      ];
      expectLater(bloc, emitsInOrder(expected));
      //act
      bloc.add(GetOpenFoodItemForBarcode(tBarcodeString));
    });
  });
}
