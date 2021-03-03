import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/features/product_manager/data/models/payload_from_json.dart';
import '../../domain/entities/open_food_item.dart';
import 'dart:convert';

class OpenFoodItemModel extends OpenFoodItem {
  OpenFoodItemModel(
      {@required int status,
      @required String statusVerbose,
      @required int barCode,
      @required String productName,
      @required List<String> storesTags})
      : super(
            status: status,
            statusVerbose: statusVerbose,
            barCode: barCode,
            productName: productName,
            storesTags: storesTags);

  factory OpenFoodItemModel.fromJson(String jsonString) {
    Payload payloadFromJson(String strr) => Payload.fromJson(json.decode(strr));
    final payload = payloadFromJson(jsonString);
    print(payload);
    print(payload.status);
    print(payload.statusVerbose);
    print(payload.barCode);
    print(payload.product);
    print(payload.product.productName);
    print(payload.product.storesTags);

    return OpenFoodItemModel(
        status: payload.status,
        statusVerbose: payload.statusVerbose,
        barCode: payload.barCode,
        productName: payload.product.productName,
        storesTags: payload.product.storesTags);
  }
  // (json['code'] as num).toInt());
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_verbose': statusVerbose,
      'code': barCode,
      'product': {'product_name': productName, 'stores_tags': storesTags},
    };
  }
}
