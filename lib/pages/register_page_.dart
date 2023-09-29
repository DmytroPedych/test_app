// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/login_page_icon_.dart';
import 'package:shoes_test_app/components/login_page_button.dart';
import 'package:shoes_test_app/components/login_page_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shoes_test_app/pages/login_page_.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
// _____________________________________________User data text field editing  controller
  final firstNameController = TextEditingController();
  final lastnameController = TextEditingController();
  final ageController = TextEditingController();
  //
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

//__________________________________________________________signUserIn method
  Future signUserUp() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: RepaintBoundary(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    //______________________________________________________SingUp user method для отправки в бд данньіх нового юзера
    try {
      //checking for the similar password textfields
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        addUserData(
          firstNameController.text.trim(),
          lastnameController.text.trim(),
          int.parse(ageController.text.trim()),
          emailController.text.trim(),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.red.shade600,
              titlePadding: const EdgeInsets.all(80),
              title: const Text(
                'Passwords dont match!',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            );
          },
        );
      }
      Navigator.of(context).popUntil(
        (route) => route.settings.name == 'HomePage',
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showErrorMethode(e.code);
    }
  }

  Future addUserData(
      String firsName, String lastName, int age, String email) async {
    await FirebaseFirestore.instance.collection('users_list').add(
      {
        'first name': firsName,
        'last name': lastName,
        'age': age,
        'email': email,
      },
    );
  }
  //______________________________________wrong email/password message method

  void showErrorMethode(String message_) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          titlePadding: const EdgeInsets.all(80),
          title: Text(
            message_,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

//_______________________________________goToLogInPage
  void goToLogInPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage(
            onTap: () {},
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastnameController.dispose();
    ageController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme_ = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        //______________________________________________виджет которьій отображает контент полностью в рамках екрана
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                //logo
                const Icon(
                  Icons.note_alt_rounded,
                  size: 80,
                ),
                const SizedBox(
                  height: 10,
                ),
                //______________________________Let\`s create an account for you
                Text(
                  translation(context).create_account_register_page,
                  style: TextStyle(
                      color: isDark ? Colors.white : Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                //___________________________username textfield
                LoginPageTextField(
                  controller: firstNameController,
                  hintText: translation(context).first_name_register_page,
                  obscuretext: false,
                ),
                LoginPageTextField(
                  controller: lastnameController,
                  hintText: translation(context).last_name_register_page,
                  obscuretext: false,
                ),
                LoginPageTextField(
                  controller: ageController,
                  hintText: translation(context).age_register_page,
                  obscuretext: false,
                ),
                LoginPageTextField(
                  controller: emailController,
                  hintText: translation(context).userEmail_register_page,
                  obscuretext: false,
                ),
                //______________________________password textfield
                LoginPageTextField(
                  controller: passwordController,
                  hintText: translation(context).userPassword_register_page,
                  obscuretext: true,
                ),
//______________________________сonfirm password
                LoginPageTextField(
                  controller: confirmPasswordController,
                  hintText: translation(context).confirmPassword_register_page,
                  obscuretext: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                //___________________________sign in button
                LogInPageButton(
                  text: translation(context).signUp_register_page,
                  onTap: signUserUp,
                ),
                //___________________________or continue with
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                          translation(context).or_continue_log_in_page,
                          style: TextStyle(
                              color: isDark ? Colors.white70 : Colors.grey[700],
                              fontWeight: FontWeight.bold),
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
                //_________________________________google + apple sign in buttons
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //_________________________________google
                      LogInPageIcon(imagePath: 'assets/png/google.png'),
                      SizedBox(
                        width: 25,
                      ),
                      //_________________________________apple sign in buttons
                      LogInPageIcon(imagePath: 'assets/png/apple.png'),
                    ],
                  ),
                ),
                //_________________________________not a member, register now
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        translation(context).already_have_acc,
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: goToLogInPage,
                        child: Text(
                          translation(context).logIn_register_page,
                          style: textTheme_.headline4,
                        ),
                      ),
                    ],
                  ),
                ),
                //______________________________________skip that step button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
