import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/my_drawer_.dart';
import 'package:shoes_test_app/pages/cart_page_.dart';
import 'package:shoes_test_app/pages/intro_page_.dart';
import 'package:shoes_test_app/pages/profile_page_.dart';
import 'package:shoes_test_app/pages/settings_page_.dart';
import 'package:shoes_test_app/pages/shop_page_.dart';
import '../components/bottom_nav_bar_.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  // final user = FirebaseAuth.instance.currentUser!;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // index for control bottomNavBar

  void navigateBottomBar(int index) {
    // method will update our selected index when user taps on bottomNavBar
    setState(() {
      _selectedIndex = index;
    });
  }

//___________________________________________ sign user out
  void signUserOut() async {
    FirebaseAuth.instance.signOut();
  }

  //________________________________________________pages to display
  final List<Widget> _pages = [
    ShopPage_(),
    CartPage_(),
    SettingPage(),
  ];

//__________________________________________drawer navigation functions
//__________________________________________ Open ProfilePage
  void gotoProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ProfilePage();
        },
      ),
    );
  }

//__________________________________________ Open Settings Page
  void gotoSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const IntroPage_();
        },
      ),
    );
  }

//__________________________________________ Open UserSignOut method
  void gotoSignUserOut() {
    signUserOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: MyDrawer(
          //_________________________________________________________navigation
          onProfileTap: gotoProfile,
          //onSettingTap: gotoSettings,
          onSignOutTap: gotoSignUserOut,
        ),
      ),
    );
  }
}
