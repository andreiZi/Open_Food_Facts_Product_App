import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/core/error/exceptions.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_model.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';
import 'package:http/http.dart' as http;

abstract class OpenFoodFactsRemoteDataSource {
  ///Calls the https://world.openfoodfacts.org/api/v0/product/{barCode} endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<OpenFoodItemModel> getOpenFoodItem(int barCode);

  ///Calls the https://world.openfoodfacts.org/api/v0/product/{barCode} endpoint
  ///
  /// Throws a [ProductNotExistingException] when the Status of recieved OpenFoodItem is 0
  /// Throws a [ServerException] for all other error codes
  Future<OpenFoodItemModel> setOpenFoodItem(OpenFoodItem openFoodItem);
}

class OpenFoodFactsRemoteDataSourceImpl extends OpenFoodFactsRemoteDataSource {
  final http.Client client;

  OpenFoodFactsRemoteDataSourceImpl({@required this.client});

  @override
  Future<OpenFoodItemModel> getOpenFoodItem(int barCode) =>
      _getOpenFoodItemFromUrl(
          'https://world.openfoodfacts.org/api/v0/product/$barCode');

  @override
  Future<OpenFoodItemModel> setOpenFoodItem(OpenFoodItem openFoodItem) =>
      throw UnimplementedError();

  Future<OpenFoodItemModel> _getOpenFoodItemFromUrl(String url) async {
    final response =
        await client.get(url, headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final recievedOpenFoodItem =
          OpenFoodItemModel.fromJson(json.decode(response.body));
      print(response.body);
      if (recievedOpenFoodItem.status == 0) {
        throw ProductNotFoundException();
      } else {
        return recievedOpenFoodItem;
      }
    } else {
      throw ServerException();
    }
  }
}
