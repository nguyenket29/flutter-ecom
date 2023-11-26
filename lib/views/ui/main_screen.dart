import 'package:flutter/material.dart';
import 'package:flutter_ecom/views/ui/cart_page.dart';
import 'package:flutter_ecom/views/ui/home_page.dart';
import 'package:flutter_ecom/views/ui/profile_page.dart';
import 'package:flutter_ecom/views/ui/search_page.dart';
import 'package:provider/provider.dart';

import '../../controllers/main_screen_controller.dart';
import '../shared/bottom_nav.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    HomePage(),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return Scaffold(
          body: Scaffold(
              body: pageList[mainScreenNotifier.pageIndex],
              bottomNavigationBar: const BottomNavBar()),
        );
      },
    );
  }
}
