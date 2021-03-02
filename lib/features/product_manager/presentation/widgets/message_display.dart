import 'package:flutter/cupertino.dart';

class MessageDisplay extends StatelessWidget {
  final String message;

  const MessageDisplay({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height / 19,
      child: Center(
        child: Center(
          child: SingleChildScrollView(
            child: Text(
              message,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
