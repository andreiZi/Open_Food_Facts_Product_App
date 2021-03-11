import 'package:equatable/equatable.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_images_model.dart';
import 'package:meta/meta.dart';

class OpenFoodItemDetails extends Equatable {
  final String productName;
  final List<String> storesTags;
  final OpenFoodItemImagesModel productImages;

  OpenFoodItemDetails(
      {@required this.productName,
      @required this.storesTags,
      @required this.productImages})
      : super([productName, storesTags, productImages]);
}
