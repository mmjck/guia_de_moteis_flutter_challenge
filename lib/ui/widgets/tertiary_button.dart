import 'package:flutter/material.dart';
import 'package:guia_de_moteis/ui/widgets/custom_typography.dart';

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
          CustomTypography(
            text: text,
            variant: TypographyVariant.h5,
            color: Colors.grey,
            weight: FontWeight.bold,
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
