import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
//TODO: Define important product data https://world.openfoodfacts.org/api/v0/product/20035594.json

class OpenFoodItem extends Equatable {
  final int status;
  final String statusVerbose;
  final int barCode;
  final Product product;

  OpenFoodItem(
      {@required this.status,
      @required this.statusVerbose,
      @required this.barCode,
      @required this.product})
      : super([status, statusVerbose, barCode, product]);
}

class Product extends Equatable {
  final String productName;
  final List<String> storesTags;

  Product({
    @required this.productName,
    @required this.storesTags,
  }) : super([productName, storesTags]);

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
