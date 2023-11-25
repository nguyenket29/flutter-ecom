import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

import '../../controllers/main_screen_controller.dart';
import 'bottom_nav_wiget.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenNotifier>(
      builder: (context, mainScreenNotifier, child) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomNavWiget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 0;
                  },
                  iconData: mainScreenNotifier.pageIndex == 0
                      ? Ionicons.home
                      : Ionicons.home_outline,
                ),
                BottomNavWiget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 1;
                  },
                  iconData: mainScreenNotifier.pageIndex == 1
                      ? Ionicons.search
                      : Ionicons.search_outline,
                ),
                BottomNavWiget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 2;
                  },
                  iconData: mainScreenNotifier.pageIndex == 2
                      ? Ionicons.add_circle
                      : Ionicons.add_circle_outline,
                ),
                BottomNavWiget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 3;
                  },
                  iconData: mainScreenNotifier.pageIndex == 3
                      ? Ionicons.cart
                      : Ionicons.cart_outline,
                ),
                BottomNavWiget(
                  onTap: () {
                    mainScreenNotifier.pageIndex = 4;
                  },
                  iconData: mainScreenNotifier.pageIndex == 4
                      ? Ionicons.person
                      : Ionicons.person_outline,
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
