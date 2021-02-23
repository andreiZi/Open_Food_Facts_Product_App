import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:food_api_test_app/features/product_manager/domain/repositories/OpenFood_repository.dart';
import 'package:food_api_test_app/features/product_manager/domain/usecases/set_product.dart';
import 'package:mockito/mockito.dart';

class MockOpenFoodFactsRepository extends Mock
    implements OpenFoodFactsRepository {}

main() {
  SetOpenFoodItem usecase;
  MockOpenFoodFactsRepository mockOpenFoodFactsRepository;

  setUp(() {
    mockOpenFoodFactsRepository = MockOpenFoodFactsRepository();
    usecase = SetOpenFoodItem(mockOpenFoodFactsRepository);
  });

  final topenFoodItem =
      OpenFoodItem(status: 1, statusVerbose: 'product found', barCode: 999999);
  final tstatusOK = '200';
  final tstatusNotFound = '404';

  test(
      'should set an Open Food Item (Product) for the barCode in the repository',
      () async {
    //arrange
    when(mockOpenFoodFactsRepository.setProduct(topenFoodItem))
        .thenAnswer((_) async => Right(topenFoodItem));
    //act
    final result = await usecase(Params(openFoodItem: topenFoodItem));
    //assert
    expect(result, Right(topenFoodItem));
    verify(mockOpenFoodFactsRepository.setProduct(topenFoodItem));
    verifyNoMoreInteractions(mockOpenFoodFactsRepository);
  });
}
