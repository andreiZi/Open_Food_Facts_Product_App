import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_details_model.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item_details.dart';

import '../../domain/entities/open_food_item.dart';
import 'package:meta/meta.dart';

class OpenFoodItemModel extends OpenFoodItem {
  OpenFoodItemModel({
    @required int status,
    @required String statusVerbose,
    @required int barCode,
    @required OpenFoodItemDetailsModel productDetails,
  }) : super(
          status: status,
          statusVerbose: statusVerbose,
          barCode: barCode,
          productDetails: productDetails,
        );

  factory OpenFoodItemModel.fromJson(Map<String, dynamic> json) {
    return OpenFoodItemModel(
      status: json["status"] == null ? null : json["status"],
      statusVerbose:
          json["status_verbose"] == null ? null : json["status_verbose"],
      barCode: json["code"] is String ? int.parse(json["code"]) : json["code"],
      productDetails: json["product"] == null
          ? null
          : OpenFoodItemDetailsModel.fromJson(json["product"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_verbose': statusVerbose,
      'code': barCode,
      'product': {
        'product_name': productDetails.productName,
        'stores_tags': productDetails.storesTags
      },
    };
  }
}
