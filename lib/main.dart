import 'package:flutter/material.dart';

import 'services/client.dart';
import 'views/home_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ClientService.config();

  runApp(const MyApp());
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
