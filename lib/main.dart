import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'repositories/product.dart';
import 'view_models/cart_view_model.dart';
import 'view_models/product_view_model.dart';
import 'views/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ProductViewModel(
          MockProductRepository(),
        ),
      ),
      ChangeNotifierProvider(
        create: (_) => CartViewModel(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVVM Example shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
