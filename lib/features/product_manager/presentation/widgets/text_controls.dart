import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextControl extends StatefulWidget {
  const TextControl({
    Key key,
  }) : super(key: key);

  @override
  _TextControlState createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchGetProduct();
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
                onPressed: dispatchGetProduct,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: RaisedButton(
                child: Text('Upload Product'),
                onPressed: dispatchPostProduct,
              ),
            )
          ],
        )
      ],
    );
  }

  void dispatchGetProduct() {
    controller.clear();
  }

  void dispatchPostProduct() {
    controller.clear();
  }
}
