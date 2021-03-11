import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item_details.dart';
import 'package:meta/meta.dart';

import 'open_food_item_images_model.dart';

class OpenFoodItemDetailsModel extends OpenFoodItemDetails {
  OpenFoodItemDetailsModel(
      {@required String productName,
      @required List<String> storesTags,
      @required OpenFoodItemImagesModel productImages})
      : super(
            productName: productName,
            storesTags: storesTags,
            productImages: productImages);

  factory OpenFoodItemDetailsModel.fromJson(Map<String, dynamic> json) =>
      OpenFoodItemDetailsModel(
          productName:
              json['product_name'] == null ? null : json['product_name'],
          storesTags: json['stores_tags'] == null
              ? null
              : List<String>.from(json['stores_tags']),
          productImages: json['selected_images'] == null
              ? null
              : OpenFoodItemImagesModel.fromJson(json['selected_images']));

  Map<String, dynamic> toJson() {
    final images = productImages;
    return {
      'product_name': productName == null ? null : productName,
      'stores_tags': storesTags == null ? null : storesTags,
      'selected_images': {
        'front': {
          'small': {
            'de': images.frontImage.smallPicture.de == null
                ? null
                : images.frontImage.smallPicture.de,
            'fr': images.frontImage.smallPicture.fr == null
                ? null
                : images.frontImage.smallPicture.fr
          },
          'thumb': {
            'de': images.frontImage.thumbPicture.de == null
                ? null
                : images.frontImage.thumbPicture.de,
            'fr': images.frontImage.thumbPicture.fr == null
                ? null
                : images.frontImage.thumbPicture.fr
          },
          'display': {
            'de': images.frontImage.displayPicture.de == null
                ? null
                : images.frontImage.displayPicture.de,
            'fr': images.frontImage.displayPicture.fr == null
                ? null
                : images.frontImage.displayPicture.fr
          }
        },
        'nutrition': {
          'small': {
            'de': images.nutritionImage.smallPicture.de == null
                ? null
                : images.nutritionImage.smallPicture.de,
            'fr': images.nutritionImage.smallPicture.fr == null
                ? null
                : images.nutritionImage.smallPicture.fr
          },
          'thumb': {
            'de': images.nutritionImage.thumbPicture.de == null
                ? null
                : images.nutritionImage.thumbPicture.de,
            'fr': images.nutritionImage.thumbPicture.fr == null
                ? null
                : images.nutritionImage.thumbPicture.fr
          },
          'display': {
            'de': images.nutritionImage.displayPicture.de == null
                ? null
                : images.nutritionImage.displayPicture.de,
            'fr': images.nutritionImage.displayPicture.fr == null
                ? null
                : images.nutritionImage.displayPicture.fr
          }
        },
        'ingredients': {
          'small': {
            'de': images.ingredientsImage.smallPicture.de == null
                ? null
                : images.ingredientsImage.smallPicture.de,
            'fr': images.ingredientsImage.smallPicture.fr == null
                ? null
                : images.ingredientsImage.smallPicture.fr
          },
          'thumb': {
            'de': images.ingredientsImage.thumbPicture.de == null
                ? null
                : images.ingredientsImage.thumbPicture.de,
            'fr': images.ingredientsImage.thumbPicture.fr == null
                ? null
                : images.ingredientsImage.thumbPicture.fr
          },
          'display': {
            'de': images.ingredientsImage.displayPicture.de == null
                ? null
                : images.ingredientsImage.displayPicture.de,
            'fr': images.ingredientsImage.displayPicture.fr == null
                ? null
                : images.ingredientsImage.displayPicture.fr
          }
        }
      }
    };
  }
}
