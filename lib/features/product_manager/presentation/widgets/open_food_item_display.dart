import 'package:flutter/cupertino.dart';
import 'package:food_api_test_app/features/product_manager/domain/entities/open_food_item.dart';

class OpenFoodItemTitleDisplay extends StatelessWidget {
  final OpenFoodItem openFoodItem;

  const OpenFoodItemTitleDisplay({Key key, this.openFoodItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 19,
      child: Column(
        children: <Widget>[
          Text(
            openFoodItem.productName,
            style: TextStyle(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
