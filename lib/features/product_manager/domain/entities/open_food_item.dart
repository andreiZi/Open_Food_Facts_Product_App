import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
//TODO: Define important product data https://world.openfoodfacts.org/api/v0/product/20035594.json

class OpenFoodItem extends Equatable {
  final int status;
  final String statusVerbose;
  final int barCode;
  final List<String> storesTags;
  final String productName;

  OpenFoodItem(
      {@required this.status,
      @required this.statusVerbose,
      @required this.barCode,
      @required this.productName,
      @required this.storesTags})
      : super([status, statusVerbose, barCode, productName, storesTags]);
}

class ProductInformation extends Equatable {
  final List<String> storesTags;
  final String productName;

  ProductInformation({@required this.storesTags, @required this.productName})
      : super([storesTags, productName]);
}

class ProductImages extends Equatable {
  final String image_front_url;

  ProductImages({@required this.image_front_url}) : super([image_front_url]);
}

class Ingredients {
  final String ingredients_text;
  final String ingredients_text_with_allergens;
  final String ingredients_text_de;
  final String ingredients_text_with_allergens_de;

  Ingredients(
      {@required this.ingredients_text,
      @required this.ingredients_text_with_allergens,
      @required this.ingredients_text_de,
      @required this.ingredients_text_with_allergens_de});
}

class Nutriments100Gramm {
  final int energy_kcal_100g;
  final int energy_100g;
  final int fat_100g;
  final int saturated_fat_100g;
  final int carbohydrates_100g;
  final int sugars_100g;
  final int proteins_100g;
  final int salt_100g;

  final int nutrition_score_fr_100g;
  final int sodium_100g;
  final int nova_group_100g;
  final int fiber_100g;

  Nutriments100Gramm(
      {@required this.energy_kcal_100g,
      @required this.energy_100g,
      @required this.fat_100g,
      @required this.saturated_fat_100g,
      @required this.carbohydrates_100g,
      @required this.sugars_100g,
      @required this.proteins_100g,
      @required this.salt_100g,
      @required this.nutrition_score_fr_100g,
      @required this.sodium_100g,
      @required this.nova_group_100g,
      @required this.fiber_100g});
}
