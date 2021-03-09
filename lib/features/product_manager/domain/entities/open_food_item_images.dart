import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_images_model.dart';

class OpenFoodItemImages extends Equatable {
  final NutritionImage nutritionImage;
  final FrontImage frontImage;
  final IngredientsImage ingredientsImage;

  OpenFoodItemImages(
      {@required this.nutritionImage,
      @required this.frontImage,
      @required this.ingredientsImage})
      : super([nutritionImage, frontImage, ingredientsImage]);
}

class NutritionImage extends Equatable {
  final SmallPicture smallPicture;
  final DisplayPicture displayPicture;
  final ThumbPicture thumbPicture;

  NutritionImage(
      {@required this.smallPicture,
      @required this.displayPicture,
      @required this.thumbPicture})
      : super([smallPicture, displayPicture, thumbPicture]);
}

class FrontImage extends Equatable {
  final SmallPicture smallPicture;
  final DisplayPicture displayPicture;
  final ThumbPicture thumbPicture;
  FrontImage(
      {@required this.smallPicture,
      @required this.displayPicture,
      @required this.thumbPicture})
      : super([smallPicture, displayPicture, thumbPicture]);
}

class IngredientsImage extends Equatable {
  final SmallPicture smallPicture;
  final DisplayPicture displayPicture;
  final ThumbPicture thumbPicture;

  IngredientsImage(
      {@required this.smallPicture,
      @required this.displayPicture,
      @required this.thumbPicture})
      : super([smallPicture, displayPicture, thumbPicture]);
}

class SmallPicture extends Equatable {
  final PictureCountry pictureCountry;

  SmallPicture({@required this.pictureCountry}) : super([pictureCountry]);
}

class DisplayPicture extends Equatable {
  final PictureCountry pictureCountry;
  DisplayPicture({@required this.pictureCountry}) : super([pictureCountry]);
}

class ThumbPicture extends Equatable {
  final PictureCountry pictureCountry;
  ThumbPicture({@required this.pictureCountry}) : super([pictureCountry]);
}

class PictureCountry extends Equatable {
  final String de;
  final String fr;

  PictureCountry({@required this.de, @required this.fr}) : super([de, fr]);
}
