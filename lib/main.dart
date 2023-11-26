import 'package:flutter/material.dart';
import 'package:flutter_ecom/controllers/product_provider.dart';
import 'package:provider/provider.dart';

import 'controllers/main_screen_controller.dart';
import 'views/ui/main_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MainScreenNotifier()),
    ChangeNotifierProvider(create: (context) => ProductNotifier())
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MainScreen());
  }
}
