import 'package:equatable/equatable.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_details_model.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_images_model.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item_images.dart';
import 'package:meta/meta.dart';
//TODO: Define important product data https://world.openfoodfacts.org/api/v0/product/20035594.json

class OpenFoodItem extends Equatable {
  final int status;
  final String statusVerbose;
  final int barCode;
  final OpenFoodItemDetailsModel productDetails;

  OpenFoodItem({
    @required this.status,
    @required this.statusVerbose,
    @required this.barCode,
    @required this.productDetails,
  }) : super([
          status,
          statusVerbose,
          barCode,
          productDetails,
        ]);
}
