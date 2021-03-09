import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item_images.dart';

class OpenFoodItemImagesModel extends OpenFoodItemImages {
  OpenFoodItemImagesModel(
      {@required NutritionImageModell nutritionImageModell,
      @required FrontImageModell frontImageModell,
      @required IngredientsImageModell ingredientsImageModell})
      : super(
            nutritionImage: nutritionImageModell,
            frontImage: frontImageModell,
            ingredientsImage: ingredientsImageModell);
  factory OpenFoodItemImagesModel.fromJson(Map<String, dynamic> json) {
    return OpenFoodItemImagesModel(
        nutritionImageModell:
            json['nutrition'] == null ? null : json['nutrition'],
        frontImageModell: json['front'] == null ? null : json['front'],
        ingredientsImageModell:
            json['ingredients'] == null ? null : json['ingredients']);
  }

  Map<String, dynamic> toJSon() {
    return {
      'nutrition': nutritionImage,
      'front': frontImage,
      'ingredients': ingredientsImage
    };
  }
}

class NutritionImageModell extends NutritionImage {
  NutritionImageModell(
      {@required SmallPictureModell smallPictureModell,
      @required DisplayPictureModell displayPictureModell,
      @required ThumbPictureModell thumbPictureModell})
      : super(
            smallPicture: smallPictureModell,
            displayPicture: displayPictureModell,
            thumbPicture: thumbPictureModell);
}

class FrontImageModell extends FrontImage {
  FrontImageModell(
      {@required SmallPictureModell smallPictureModell,
      @required DisplayPictureModell displayPictureModell,
      @required ThumbPictureModell thumbPictureModell})
      : super(
            smallPicture: smallPictureModell,
            displayPicture: displayPictureModell,
            thumbPicture: thumbPictureModell);
}

class IngredientsImageModell extends IngredientsImage {
  IngredientsImageModell(
      {@required SmallPictureModell smallPictureModell,
      @required DisplayPictureModell displayPictureModell,
      @required ThumbPictureModell thumbPictureModell})
      : super(
            smallPicture: smallPictureModell,
            displayPicture: displayPictureModell,
            thumbPicture: thumbPictureModell);
}

class SmallPictureModell extends SmallPicture {
  SmallPictureModell({@required PictureCountryModell pictureCountryModell})
      : super(pictureCountry: pictureCountryModell);
}

class DisplayPictureModell extends DisplayPicture {
  DisplayPictureModell({@required PictureCountryModell pictureCountryModell})
      : super(pictureCountry: pictureCountryModell);
}

class ThumbPictureModell extends ThumbPicture {
  ThumbPictureModell({@required PictureCountryModell pictureCountryModell})
      : super(pictureCountry: pictureCountryModell);
}

class PictureCountryModell extends PictureCountry {
  PictureCountryModell({@required String de, @required String fr})
      : super(de: de, fr: fr);
}
