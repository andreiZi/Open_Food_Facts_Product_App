import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_details_model.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_images_model.dart';
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
            productDetails: productDetails);

  factory OpenFoodItemModel.fromJson(Map<String, dynamic> json) {
    return OpenFoodItemModel(
        status: json["status"] == null ? null : json["status"],
        statusVerbose:
            json["status_verbose"] == null ? null : json["status_verbose"],
        barCode:
            json["code"] is String ? int.parse(json["code"]) : json["code"],
        productDetails: json["product"] == null
            ? null
            : OpenFoodItemDetailsModel.fromJson(json["product"]));
  }

  Map<String, dynamic> toJson() {
    final images = productDetails.productImages;
    return {
      'status': status == null ? null : status,
      'status_verbose': statusVerbose == null ? null : statusVerbose,
      'code': barCode == null ? null : barCode,
      'product': {
        'product_name': productDetails.productName == null
            ? null
            : productDetails.productName,
        'stores_tags': productDetails.storesTags == null
            ? null
            : productDetails.storesTags,
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
      },
    };
  }
}
