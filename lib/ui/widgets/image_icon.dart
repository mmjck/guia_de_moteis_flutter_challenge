import 'package:flutter/material.dart';

class AvatarImageIcon extends StatelessWidget {
  final String path;
  const AvatarImageIcon({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Image.network(
        path,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.error, size: 50, color: Colors.red);
        },
        fit: BoxFit.cover,
        width: 50,
        height: 50,
      ),
    );
  }
}
