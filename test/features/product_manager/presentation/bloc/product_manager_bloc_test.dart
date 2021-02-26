import 'package:flutter_test/flutter_test.dart';
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
}
