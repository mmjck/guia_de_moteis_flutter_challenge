import 'package:flutter/material.dart';

class CustomTypography extends StatelessWidget {
  final String text;
  final TypographyVariant variant;
  final TextAlign? align;
  final TextDecoration? decoration;
  final FontWeight? weight;
  final Color? color;

  const CustomTypography({
    super.key,
    required this.text,
    required this.variant,
    this.weight,
    this.color,
    this.align,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _buildVariant(),
      textAlign: align,
    );
  }

  TextStyle _buildVariant() {
    switch (variant) {
      case TypographyVariant.h1:
        return TextStyle(
          fontSize: 24,
          fontWeight: weight,
          color: color,
          decoration: decoration,
        );
      case TypographyVariant.h2:
        return TextStyle(
          fontSize: 18,
          fontWeight: weight,
          color: color,
          decoration: decoration,
        );
      case TypographyVariant.h3:
        return TextStyle(
          fontSize: 16,
          fontWeight: weight,
          decoration: decoration,
          color: color,
        );
      case TypographyVariant.h4:
        return TextStyle(
          fontSize: 14,
          fontWeight: weight,
          color: color,
          decoration: decoration,
        );
      case TypographyVariant.h5:
        return TextStyle(
          fontSize: 12,
          fontWeight: weight,
          color: color,
          decoration: decoration,
        );
    }
  }
}

enum TypographyVariant { h1, h2, h3, h4, h5 }
