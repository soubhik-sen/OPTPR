// lib/widgets/section_bg_image.dart
import 'package:flutter/material.dart';

class SectionBGImage extends StatelessWidget {
  final String path;
  const SectionBGImage(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stack) {
        // Helps you SEE when the asset path is wrong or not bundled
        debugPrint("Asset failed to load: $path — $error");
        return Container(
          color: Colors.deepOrange.withOpacity(0.2),
          alignment: Alignment.center,
          child: Text(
            "Missing asset:\n$path",
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
