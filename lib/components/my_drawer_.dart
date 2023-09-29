import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/auth_scope.dart';
import 'package:shoes_test_app/pages/login_page_.dart';

import 'my_list_tile_.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOutTap;
  const MyDrawer(
      {super.key, required this.onProfileTap, required this.onSignOutTap});

  @override
  Widget build(BuildContext context) {
    final User? user = AuthScope.userOf(context);

    return Drawer(
      backgroundColor: Colors.grey[900],
      child: ListView(
        // padding:
        //     const EdgeInsets.only(left: 20, top: 5, bottom: 10, right: 20),
        children: [
          const SizedBox(
            height: 40,
          ),
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.white38,
              radius: 95,
              child: CircleAvatar(
                backgroundImage: const AssetImage('assets/jpg/intro_back.jpg'),
                radius: 90,
                onBackgroundImageError: (exception, stackTrace) =>
                    debugPrint('image issue $exception,$stackTrace'),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 20),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                user?.email?.split('@')[0].toString() ??
                    translation(context).not_def,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                user?.email ?? translation(context).anonymous_drawer,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
          ),
          // const UserAccountsDrawerHeader(
          //   // margin: const EdgeInsets.only(left: 0, bottom: 0),
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(20),
          //         topRight: Radius.circular(20),
          //         bottomLeft: Radius.circular(20),
          //         bottomRight: Radius.circular(20)),
          //   ),
          // accountName: Text(
          //   "Dmytro Pedych",
          //   style: TextStyle(
          //       fontSize: 20,
          //       fontWeight: FontWeight.bold,
          //       color: Colors.white),
          // ),
          //   accountEmail: Text(
          //     'pedich.dmitry@gmail.com', // можно передать переменную accountEmail)
          //     style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white),
          //   ),
          //   currentAccountPicture: CircleAvatar(
          //     backgroundColor: Colors.white38,
          //     radius: 95,
          //     child: CircleAvatar(
          //       backgroundImage: AssetImage('assets/jpg/intro_back.jpg'),
          //       radius: 90,
          //     ),
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20, bottom: 0),
            child: Divider(
              color: Colors.white38,
              thickness: 1,
            ),
          ),
          MyListTile(
            icon: Icons.home,
            // text: AppLocalizations.of(context)!.shop_drawer,
            text: translation(context).shop_drawer,
            onTap: () => Navigator.pop(context),
          ),
          if (user != null)
            MyListTile(
              icon: Icons.person_pin_rounded,
              text: translation(context).profile_drawer,
              onTap: onProfileTap,
            ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 5),
            child: AboutListTile(
              icon: const Icon(Icons.info, color: Colors.white),
              applicationIcon: const Icon(Icons.local_offer_outlined),
              applicationName: "Shoes App",
              applicationVersion: '1.0.0',
              applicationLegalese: '2023 Company',
              aboutBoxChildren: const [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Text field for some additional information',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
              child: Text(
                translation(context).about_drawer,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 180),
            child: Divider(
              color: Colors.white38,
              thickness: 1,
            ),
          ),
          if (user != null)
            MyListTile(
              icon: Icons.login,
              text: translation(context).log_out_drawer,
              onTap: onSignOutTap,
            )
          else
            MyListTile(
              icon: Icons.login,
              text: translation(context).log_in_drawer,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(onTap: () {}),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
