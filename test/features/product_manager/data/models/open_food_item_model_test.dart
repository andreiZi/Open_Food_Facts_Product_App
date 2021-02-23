import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_model.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  final tproductManagerModel = OpenFoodItemModel(
      barCode: 9999999, status: 1, statusVerbose: 'product found');

  test('should be a sublass of the ProducManager entitity', () async {
    //assert
    expect(tproductManagerModel, isA<OpenFoodItem>());
  });

  group('fromJSon', () {
    test('should return a valid model when the Json is a valid integer ',
        () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('product_barcode_number.json'));
      //act
      final result = OpenFoodItemModel.fromJson(jsonMap);
      //assert
      expect(result, tproductManagerModel);
    });

    test('should return a valid model when the Json is regarded as a string',
        () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('product_barcode_string.json'));
      //act
      final result = OpenFoodItemModel.fromJson(jsonMap);
      //assert
      expect(result, tproductManagerModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      //act
      final result = tproductManagerModel.toJson();
      //assert
      final expectedMap = {
        'status': 1,
        'status_verbose': "product found",
        'code': 9999999
      };
      expect(result, expectedMap);
    });
  });
}
