import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item_details.dart';
import 'package:meta/meta.dart';

class OpenFoodItemDetailsModel extends OpenFoodItemDetails {
  OpenFoodItemDetailsModel(
      {@required String productName, @required List<String> storesTags})
      : super(productName: productName, storesTags: storesTags);

  factory OpenFoodItemDetailsModel.fromJson(Map<String, dynamic> json) =>
      OpenFoodItemDetailsModel(
          productName:
              json["product_name"] == null ? null : json["product_name"],
          storesTags: json["stores_tags"] == null
              ? null
              : List<String>.from(json['stores_tags']));

  Map<String, dynamic> toJson() => {
        "product_name": productName == null ? null : productName,
        "stores_tags": storesTags == null ? null : storesTags
      };
}
