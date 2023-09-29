import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoes_test_app/components/language_constants_.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          padding: const EdgeInsets.all(10),
          color: Colors.white,
          activeColor: Colors.white,
          backgroundColor: Colors.black,
          // tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade800,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 20,
          onTabChange: (value) => onTabChange!(value),
          textStyle: const TextStyle(
              fontFamily: 'Consolas',
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          gap: 10,
          tabs: [
            GButton(
              icon: Icons.home,
              text: translation(context).shop_icon,
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: translation(context).cart_icon,
            ),
            GButton(
              icon: Icons.settings,
              text: translation(context).settings_icon,
            ),
          ],
        ),
      ),
    );
  }
}
