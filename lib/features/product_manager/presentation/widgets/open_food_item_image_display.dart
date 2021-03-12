import 'package:flutter/widgets.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item_images.dart';

class OpenFoodItemImagesDisplay extends StatelessWidget {
  final OpenFoodItemImages openFoodItemImages;

  const OpenFoodItemImagesDisplay({Key key, this.openFoodItemImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 3,
        child: showImage(openFoodItemImages.frontImage.displayPicture));
  }

  Image showImage(DisplayPicture image) {
    if (image == null) {
      return Image.asset('images/gifs/404-animated.gif');
    }
    return Image.network(showImageForCountry(image));
  }

  String showImageForCountry(DisplayPicture image) {
    final germanImage = image.de;
    final frenchImage = image.fr;
    if (germanImage != null) {
      return germanImage;
    }
    return frenchImage;
  }
}
