import 'package:flutter/material.dart';

class LogInPageIcon extends StatelessWidget {
  final String imagePath;
  const LogInPageIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
          20), //_____________отступ от иконки внутри границьі
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary),
      child: Image.asset(
        imagePath,
        height: 60,
      ),
    );
  }
}
