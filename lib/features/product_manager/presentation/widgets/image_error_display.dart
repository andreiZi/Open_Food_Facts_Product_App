import 'package:flutter/widgets.dart';

class ImageErrorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: Image.asset('assets/gifs/404-animated.gif'),
    );
  }
}
