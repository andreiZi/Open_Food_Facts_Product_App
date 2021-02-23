import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
//TODO: Define important product data https://world.openfoodfacts.org/api/v0/product/20035594.json

class OpenFoodItem extends Equatable {
  final int status;
  final String statusVerbose;
  final int barCode;

  OpenFoodItem(
      {@required this.status,
      @required this.statusVerbose,
      @required this.barCode})
      : super([status, statusVerbose, barCode]);
}

class Product {
  final List<String> stores_tags;
  final List<String> last_image_dates_tags;
  final String labels;

  Product(
      {@required this.stores_tags,
      @required this.last_image_dates_tags,
      @required this.labels});
}

class Images {
  final String image_front_thumb_url;

  Images({@required this.image_front_thumb_url});
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
