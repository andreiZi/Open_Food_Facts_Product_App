import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_api_test_app/features/product_manager/presentation/bloc/bloc.dart';

class OpenFoodItemControls extends StatefulWidget {
  const OpenFoodItemControls({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OpenFoodItemControlsState();
}

class _OpenFoodItemControlsState extends State<OpenFoodItemControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Input Barcode',
        ),
        onChanged: (value) {
          inputStr = value;
        },
        onSubmitted: (_) {
          dispatchBarcode();
        },
      ),
      SizedBox(height: 10),
      Row(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text('Search'),
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
              onPressed: dispatchBarcode,
            ),
          )
        ],
      )
    ]);
  }

  void dispatchBarcode() {
    controller.clear();
    BlocProvider.of<ProductManagerBloc>(context)
        .add(GetOpenFoodItemForBarcode(inputStr));
  }
}
