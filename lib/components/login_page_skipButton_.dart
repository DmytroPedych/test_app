import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/language_constants_.dart';

class SkipButton extends StatelessWidget {
  final Function()? onTap;
  const SkipButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            translation(context).skip_button_log_in_page,
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: 'Times New Roman',
            ),
          ),
        ),
      ),
    );
  }
}
