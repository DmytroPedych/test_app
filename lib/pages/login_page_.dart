// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/login_page_icon_.dart';
import 'package:shoes_test_app/components/login_page_button.dart';
import 'package:shoes_test_app/components/login_page_textfield.dart';
import 'package:shoes_test_app/pages/home_page_.dart';
import 'package:shoes_test_app/pages/register_page_.dart';
import '../components/login_page_skipButton_.dart';
import 'forgot_password_page_.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
// _____________________________________________text field editing  controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//__________________________________________________________signUserIn method
  Future signUserIn() async {
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
    //______________________________________________________SingIn user method для отправки в бд запроса
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.of(context).popUntil(
        (route) => route.settings.name == 'HomePage',
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop();
      showErrorMethode(e.code);
      // if (e.code == 'user-not-found') {
      //   //______________________________________wrong email message
      //   wrongEmailMessage();
      //   print(
      //       "_______________NO USER FOUND FOR THAT EMAIL_______________________");
      // } else if (e.code == 'wrong-password') {
      //   //______________________________________wrong password message
      //   wrongPasswordMessage();
      //   print("_______________WRONG PASWORD!______________");
      // }
    }

    //navigatorKey.currentState!.popUntil((route) => route.isFirst);
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

//__________________________________________goToRegisterPage
  void goToRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RegisterPage(
            onTap: () {},
          );
        },
      ),
    );
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
                  height: 50,
                ),
                //logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(
                  height: 30,
                ),
                //______________________________welcome back u`ve been missed
                Text(
                  translation(context).welcome_back_log_in_page,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                //___________________________username textfield
                LoginPageTextField(
                  controller: emailController,
                  hintText: translation(context).userEmail_log_in_page,
                  obscuretext: false,
                ),
                //password
                LoginPageTextField(
                  controller: passwordController,
                  hintText: translation(context).userPassword_log_in_page,
                  obscuretext: true,
                ),

                //____________________________forgot password
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //____________________________________________- navigator with MaterialPageRoute
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          translation(context).forgotPassword_log_in_page,
                          style: textTheme_.headline4?.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //___________________________sign in button
                LogInPageButton(
                  text: translation(context).sign_in,
                  onTap: signUserIn,
                ),
                //___________________________or continue with
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
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
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
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
                        translation(context).not_a_member_log_in_page,
                        style: TextStyle(
                            color: isDark ? Colors.white70 : Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: goToRegisterPage,
                        child: Text(
                          translation(context).register_now_log_in_page,
                          style: textTheme_.headline4,
                        ),
                      ),
                    ],
                  ),
                ),
                //______________________________________skip that step button
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: SkipButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return HomePage();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
