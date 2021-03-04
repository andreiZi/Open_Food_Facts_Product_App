import 'package:flutter/cupertino.dart';
import '../../domain/entities/open_food_item.dart';
import 'dart:convert';

class OpenFoodItemModel extends OpenFoodItem {
  OpenFoodItemModel({
    @required int status,
    @required String statusVerbose,
    @required int barCode,
    @required Product product,
  }) : super(
          status: status,
          statusVerbose: statusVerbose,
          barCode: barCode,
          product: product,
        );

  factory OpenFoodItemModel.fromJson(Map<String, dynamic> json) {
    //Payload payloadFromJson(String strr) => Payload.fromJson(json.decode(strr));

    return OpenFoodItemModel(
      status: json["status"] == null ? null : json["status"],
      statusVerbose:
          json["status_verbose"] == null ? null : json["status_verbose"],
      barCode: json["code"] is String ? int.parse(json["code"]) : json["code"],
      product:
          json["product"] == null ? null : Product.fromJson(json["product"]),
    );
  }
  // (json['code'] as num).toInt());
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_verbose': statusVerbose,
      'code': barCode,
      'product': {
        'product_name': product.productName,
        'stores_tags': product.storesTags
      },
    };
  }
}
