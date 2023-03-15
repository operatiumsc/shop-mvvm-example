import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_mvvm_example/repositories/product.dart';
import 'package:shop_mvvm_example/view_models/product_view_model.dart';

import 'views/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ProductViewModel(MockProductRepository())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVVM Example shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
