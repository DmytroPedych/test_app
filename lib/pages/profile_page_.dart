import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/auth_scope.dart';

import '../components/my_text_box_.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> editField(String field) async {}
  @override
  Widget build(BuildContext context) {
    final User? user = AuthScope.userOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            translation(context).profile_page,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          // ____________________________profile photo
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.white38,
              radius: 120,
              child: CircleAvatar(
                backgroundImage: const AssetImage('assets/jpg/intro_back.jpg'),
                radius: 115,
                onBackgroundImageError: (exception, stackTrace) =>
                    debugPrint('image issue $exception,$stackTrace'),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              user?.email ?? translation(context).anonymous_drawer,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.normal,
                fontFamily: 'Monserrat',
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: Divider(
                    thickness: 1,
                    color: Colors.grey[400],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    translation(context).myDetails_profile_page,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 1,
                  color: Colors.grey[400],
                ))
              ],
            ),
          ),

          // ____________________________user Details
          MyTextBox(
            text: user?.email?.split('@')[0].toString() ??
                translation(context).anonymous_drawer,
            sectionName: translation(context).userName_profile_page,
            onPressed: () => editField('username'),
          ),
          MyTextBox(
            text: '22',
            sectionName: translation(context).age_profile_page,
            onPressed: () => editField('username'),
          ),

          // ____________________________user Email

          // ____________________________
        ],
      ),
    );
  }
}
