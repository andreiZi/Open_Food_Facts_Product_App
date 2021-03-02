import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:food_api_test_app/features/product_manager/domain/repositories/OpenFood_repository.dart';
import 'package:food_api_test_app/features/product_manager/domain/usecases/get_product.dart';
import 'package:mockito/mockito.dart';

class MockOpenFoodFactsRepository extends Mock
    implements OpenFoodFactsRepository {}

void main() {
  GetOpenFoodItem usecase;
  MockOpenFoodFactsRepository mockOpenFoodFactsRepository;

  setUp(() {
    mockOpenFoodFactsRepository = MockOpenFoodFactsRepository();
    usecase = GetOpenFoodItem(mockOpenFoodFactsRepository);
  });

  final tbarCode = 999999;
  final topenFoodItem =
      OpenFoodItem(status: 1, statusVerbose: 'product found', barCode: 999999);

  test(
      'should get an Open Food Item (Product) for the barCode from the repository',
      () async {
    //arrange
    when(mockOpenFoodFactsRepository.getOpenFoodItem(any))
        .thenAnswer((_) async => Right(topenFoodItem));
    //act
    final result = await usecase(Params(barCode: tbarCode));
    //assert
    expect(result, Right(topenFoodItem));
    verify(mockOpenFoodFactsRepository.getOpenFoodItem(tbarCode));
    verifyNoMoreInteractions(mockOpenFoodFactsRepository);
  });
}
