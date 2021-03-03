import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/features/product_manager/data/models/payload_from_json.dart';
import '../../domain/entities/open_food_item.dart';
import 'dart:convert';

class OpenFoodItemModel extends OpenFoodItem {
  OpenFoodItemModel({
    @required int status,
    @required String statusVerbose,
    @required int barCode,
    @required String productName,
    @required List<String> storesTags,
    @required Product product,
  }) : super(
            status: status,
            statusVerbose: statusVerbose,
            barCode: barCode,
            productName: productName,
            storesTags: storesTags);

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
      'product': {'product_name': productName, 'stores_tags': storesTags},
    };
  }
}

class Product {
  String productName;
  List<String> storesTags;

  Product({
    this.productName,
    this.storesTags,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["product_name"] == null ? null : json["product_name"],
        storesTags: json["stores_tags"] == null
            ? null
            : List<String>.from(json['stores_tags']),
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName == null ? null : productName,
        "stores_tags": storesTags == null ? null : storesTags,
      };
}
