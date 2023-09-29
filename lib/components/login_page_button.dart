import 'package:flutter/material.dart';

class LogInPageButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const LogInPageButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    //_________________________________________________signInButton
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isDark ? Colors.white : Colors.white.withOpacity(0.9),
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Times New Roman',
            ),
          ),
        ),
      ),
    );
  }
}
