import "package:flutter/material.dart";

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const MyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(146, 146, 144, 152),
            borderRadius: BorderRadius.circular(50)),
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text,
                style: const TextStyle(
                    color: Color(0xFFf7c6a4),
                    fontSize: 24,
                    fontWeight: FontWeight.normal)),
            //icon
            const SizedBox(width: 5),
            const Icon(
              Icons.arrow_forward,
              color: Color(0xFFf7c6a4),
            ),
          ],
        ),
      ),
    );
  }
}
