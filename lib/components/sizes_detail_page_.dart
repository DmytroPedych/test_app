import 'package:flutter/material.dart';
import 'package:shoes_test_app/theme/theme.dart';

class SizeButtonSelected extends StatelessWidget {
  final String label;
  SizeButtonSelected({super.key, required this.label});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: detailsPageColor,
          border: Border.all(color: Colors.deepPurple)),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
