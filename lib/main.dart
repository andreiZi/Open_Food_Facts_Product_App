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
        accentColor: Colors.deepPurple.shade600,
      ),
      home: ProductManagerPage(),
    );
  }
}
