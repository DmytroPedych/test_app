import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/login_page_button.dart';
import 'package:shoes_test_app/components/login_page_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  //__________________________________________________ reset password method
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

//___________________________________________________reset password function
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.green.shade600,
            titlePadding: const EdgeInsets.all(50),
            title: Text(
              translation(context).resetPassword_snackBar,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      showErrorMethode(e.code);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 5,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          //logo
          const Icon(
            Icons.question_answer_outlined,
            size: 100,
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Text(
              translation(context).enterEmail_forgotPass_page,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          LoginPageTextField(
            controller: emailController,
            hintText: translation(context).userEmail_forgotPass_page,
            obscuretext: false,
          ),
          const SizedBox(
            height: 20,
          ),
          LogInPageButton(
            onTap: passwordReset,
            text: translation(context).resetPassword_button_forgotPass_page,
          ),
        ],
      ),
    );
  }
}
