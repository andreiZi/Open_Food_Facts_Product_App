import 'dart:convert';
import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_details_model.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_images_model.dart';
import 'package:food_api_test_app/features/product_manager/data/models/open_food_item_model.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';

import '../../../../fixtures/fixture_reader.dart';

main() {
  final tThumbPicturemodell = ThumbPictureModell(
      de: 'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
      fr: 'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg');

  final tDisplayPictureModell = DisplayPictureModell(
      de: 'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
      fr: 'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg');

  final tSmallPictureModell = SmallPictureModell(
      de: 'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
      fr: 'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg');

  final tIngredientsImageModell = IngredientsImageModell(
      smallPictureModell: tSmallPictureModell,
      displayPictureModell: tDisplayPictureModell,
      thumbPictureModell: tThumbPicturemodell);

  final tFrontImageModell = FrontImageModell(
      smallPictureModell: tSmallPictureModell,
      displayPictureModell: tDisplayPictureModell,
      thumbPictureModell: tThumbPicturemodell);

  final tNutritionImageModell = NutritionImageModell(
      smallPictureModell: tSmallPictureModell,
      displayPictureModell: tDisplayPictureModell,
      thumbPictureModell: tThumbPicturemodell);

  final tOpenFoodItemImagesModel = OpenFoodItemImagesModel(
      nutritionImageModell: tNutritionImageModell,
      frontImageModell: tFrontImageModell,
      ingredientsImageModell: tIngredientsImageModell);

  final tOpenFoodItemDetailsModel = OpenFoodItemDetailsModel(
      productName: 'Test Product',
      storesTags: ['Wallmart', 'Lidl', 'Aldi'],
      productImages: tOpenFoodItemImagesModel);

  final tOpenFoodItemModel = OpenFoodItemModel(
      barCode: 20035594,
      status: 1,
      statusVerbose: 'product found',
      productDetails: tOpenFoodItemDetailsModel);

  group('Open Food Item Model', () {
    test('should be a sublass of the OpenFoodItem entitity', () async {
      //assert
      expect(tOpenFoodItemModel, isA<OpenFoodItem>());
    });

    group('fromJSon', () {
      test('should return a valid model when the Json is a valid integer ',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('product_barcode_number.json'));
        //final jsonString = fixture('product_barcode_number.json');

        //act
        final result = OpenFoodItemModel.fromJson(jsonMap);
        //assert
        expect(result, tOpenFoodItemModel);
      });

      test('should return a valid model when the Json is regarded as a string',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('product_barcode_number.json'));
        //final jsonString = fixture('product_barcode_string.json');
        //act
        final result = OpenFoodItemModel.fromJson(jsonMap);
        //assert
        expect(result, tOpenFoodItemModel);
      });
    });

    group('toJson', () {
      test('should return a JSON map containing the proper data', () async {
        //act
        final result = tOpenFoodItemModel.toJson();
        //assert
        final expectedMap = {
          'status': 1,
          'status_verbose': 'product found',
          'code': 20035594,
          'product': {
            'product_name': 'Test Product',
            'stores_tags': ['Wallmart', 'Lidl', 'Aldi'],
            'selected_images': {
              'front': {
                'small': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                },
                'thumb': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                },
                'display': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                }
              },
              'nutrition': {
                'small': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                },
                'thumb': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                },
                'display': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                }
              },
              'ingredients': {
                'small': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                },
                'thumb': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                },
                'display': {
                  'de':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                  'fr':
                      'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
                }
              }
            }
          }
        };
        expect(result, expectedMap);
      });
    });
  });

  group('Open Food Item Details Model', () {
    test('should be a sublass of the OpenFoodItem entitity', () async {
      //assert
      expect(tOpenFoodItemDetailsModel, isA<OpenFoodItemDetailsModel>());
    });

    group('fromJSon', () {
      test('should return a valid model when the Json is a valid integer ',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('open_food_item_details.json'));
        //act
        final result = OpenFoodItemDetailsModel.fromJson(jsonMap);
        //assert
        expect(result, tOpenFoodItemDetailsModel);
      });
    });
    group('toJson', () {
      test('should return a JSON map containing the proper data', () async {
        //act
        final result = tOpenFoodItemDetailsModel.toJson();
        //assert
        final expectedMap = {
          'product_name': 'Test Product',
          'stores_tags': ['Wallmart', 'Lidl', 'Aldi'],
          'selected_images': {
            'front': {
              'small': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              },
              'thumb': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              },
              'display': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              }
            },
            'nutrition': {
              'small': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              },
              'thumb': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              },
              'display': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              }
            },
            'ingredients': {
              'small': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              },
              'thumb': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              },
              'display': {
                'de':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
                'fr':
                    'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
              }
            }
          }
        };
        expect(result, expectedMap);
      });
    });
  });
  group('Open Food Item Images Model', () {
    test('should be a subclass of OpenFoodItemImages entitiy', () async {
      //assert
      expect(tOpenFoodItemImagesModel, isA<OpenFoodItemImagesModel>());
    });

    group('fromJson', () {
      test('should return a valid model when the Json is a valid integer',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('open_food_item_images.json'));
        //act
        final result = OpenFoodItemImagesModel.fromJson(jsonMap);
        //assert
        expect(result, tOpenFoodItemImagesModel);
      });
    });

    group('toJson', () {
      test('should return a JSON map containing the proper data', () async {
        //act
        final result = tOpenFoodItemImagesModel.toJson();
        //assert
        final expectedMap = {
          'front': {
            'small': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            },
            'thumb': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            },
            'display': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            }
          },
          'nutrition': {
            'small': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            },
            'thumb': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            },
            'display': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            }
          },
          'ingredients': {
            'small': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            },
            'thumb': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            },
            'display': {
              'de':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.100.jpg',
              'fr':
                  'https://static.openfoodfacts.org/images/products/20035594/ingredients_de.10.400.jpg'
            }
          }
        };
        expect(result, expectedMap);
      });
    });
  });
}
