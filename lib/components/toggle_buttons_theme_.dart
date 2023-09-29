import 'package:flutter/material.dart';

class ToggleButtonsTheme extends StatefulWidget {
  const ToggleButtonsTheme({super.key});

  @override
  State<ToggleButtonsTheme> createState() => _ToggleButtonsThemeState();
}

class _ToggleButtonsThemeState extends State<ToggleButtonsTheme> {
  List<bool> isSelected = [true, false, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      children: const [
        Icon(Icons.system_security_update_good_outlined),
        Icon(Icons.light_mode_outlined),
        Icon(Icons.dark_mode_outlined),
      ],
    );
  }
}
