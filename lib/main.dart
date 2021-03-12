import 'package:flutter/material.dart';
import 'package:food_api_test_app/features/product_manager/presentation/pages/product_manager_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Api Test App',
      theme: ThemeData(
          primaryColor: Colors.deepPurple.shade900,
          accentColor: _getColorFromHex('#263238'),
          backgroundColor: _getColorFromHex('#3949AB')),
      home: ProductManagerPage(),
    );
  }

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
