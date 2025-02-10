import 'package:flutter/material.dart';

class TertiaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const TertiaryButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.grey,
            size: 16,
          ),
        ],
      ),
    );
  }
}
