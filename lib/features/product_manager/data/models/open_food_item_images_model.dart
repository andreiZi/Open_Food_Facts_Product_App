import 'package:meta/meta.dart';
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
        nutritionImageModell: json['nutrition'] == null
            ? null
            : NutritionImageModell.fromJson(json['nutrition']),
        frontImageModell: json['front'] == null
            ? null
            : FrontImageModell.fromJson(json['front']),
        ingredientsImageModell: json['ingredients'] == null
            ? null
            : IngredientsImageModell.fromJson(json['ingredients']));
  }

  Map<String, dynamic> toJson() {
    final images = this;
    return {
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

  factory NutritionImageModell.fromJson(Map<String, dynamic> json) {
    return NutritionImageModell(
        smallPictureModell: json['small'] == null
            ? null
            : SmallPictureModell.fromJson(json['small']),
        displayPictureModell: json['display'] == null
            ? null
            : DisplayPictureModell.fromJson(json['display']),
        thumbPictureModell: json['thumb'] == null
            ? null
            : ThumbPictureModell.fromJson(json['thumb']));
  }

  Map<String, dynamic> toJson() {
    return {
      'small': {
        'de': smallPicture.de == null ? null : smallPicture.de,
        'fr': smallPicture.fr == null ? null : smallPicture.fr
      },
      'display': {
        'de': displayPicture.de == null ? null : displayPicture.de,
        'fr': displayPicture.fr == null ? null : displayPicture.fr
      },
      'thumb': {
        'de': thumbPicture.de == null ? null : thumbPicture.de,
        'fr': thumbPicture.fr == null ? null : thumbPicture.fr
      }
    };
  }
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

  factory FrontImageModell.fromJson(Map<String, dynamic> json) {
    return FrontImageModell(
        smallPictureModell: json['small'] == null
            ? null
            : SmallPictureModell.fromJson(json['small']),
        displayPictureModell: json['display'] == null
            ? null
            : DisplayPictureModell.fromJson(json['display']),
        thumbPictureModell: json['thumb'] == null
            ? null
            : ThumbPictureModell.fromJson(json['thumb']));
  }

  Map<String, dynamic> toJson() {
    return {
      'small': {
        'de': smallPicture.de == null ? null : smallPicture.de,
        'fr': smallPicture.fr == null ? null : smallPicture.fr
      },
      'display': {
        'de': displayPicture.de == null ? null : displayPicture.de,
        'fr': displayPicture.fr == null ? null : displayPicture.fr
      },
      'thumb': {
        'de': thumbPicture.de == null ? null : thumbPicture.de,
        'fr': thumbPicture.fr == null ? null : thumbPicture.fr
      }
    };
  }
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

  factory IngredientsImageModell.fromJson(Map<String, dynamic> json) {
    return IngredientsImageModell(
        smallPictureModell: json['small'] == null
            ? null
            : SmallPictureModell.fromJson(json['small']),
        displayPictureModell: json['display'] == null
            ? null
            : DisplayPictureModell.fromJson(json['display']),
        thumbPictureModell: json['thumb'] == null
            ? null
            : ThumbPictureModell.fromJson(json['thumb']));
  }

  Map<String, dynamic> toJson() {
    return {
      'small': {
        'de': smallPicture.de == null ? null : smallPicture.de,
        'fr': smallPicture.fr == null ? null : smallPicture.fr
      },
      'display': {
        'de': displayPicture.de == null ? null : displayPicture.de,
        'fr': displayPicture.fr == null ? null : displayPicture.fr
      },
      'thumb': {
        'de': thumbPicture.de == null ? null : thumbPicture.de,
        'fr': thumbPicture.fr == null ? null : thumbPicture.fr
      }
    };
  }
}

class SmallPictureModell extends SmallPicture {
  SmallPictureModell({@required String de, @required String fr})
      : super(de: de, fr: fr);

  factory SmallPictureModell.fromJson(Map<String, dynamic> json) {
    return SmallPictureModell(de: json['de'], fr: json['fr']);
  }

  Map<String, dynamic> toJson() {
    return {'de': de == null ? null : de, 'fr': fr == null ? null : fr};
  }
}

class DisplayPictureModell extends DisplayPicture {
  DisplayPictureModell({@required String de, @required String fr})
      : super(de: de, fr: fr);

  factory DisplayPictureModell.fromJson(Map<String, dynamic> json) {
    return DisplayPictureModell(de: json['de'], fr: json['fr']);
  }

  Map<String, dynamic> toJson() {
    return {'de': de == null ? null : de, 'fr': fr == null ? null : fr};
  }
}

class ThumbPictureModell extends ThumbPicture {
  ThumbPictureModell({@required String de, @required String fr})
      : super(de: de, fr: fr);

  factory ThumbPictureModell.fromJson(Map<String, dynamic> json) {
    return ThumbPictureModell(de: json['de'], fr: json['fr']);
  }

  Map<String, dynamic> toJson() {
    return {'de': de == null ? null : de, 'fr': fr == null ? null : fr};
  }
}
