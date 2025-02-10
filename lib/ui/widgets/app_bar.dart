import 'package:flutter/material.dart';
import 'package:guia_de_moteis/theme/colors.dart';
import 'package:guia_de_moteis/ui/widgets/custom_typography.dart';

class HeaderAppBar extends StatelessWidget {
  const HeaderAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
        decoration: const BoxDecoration(
          color: ThemeColors.header,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTypography(
                    text: "são paulo",
                    variant: TypographyVariant.h2,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
