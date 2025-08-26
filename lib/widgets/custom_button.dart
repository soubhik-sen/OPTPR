import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool filled;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(borderRadius: BorderRadius.circular(16));
    if (filled) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.neon,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: shape,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.label.copyWith(color: Colors.black)),
      );
    } else {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.neon, width: 1.5),
          foregroundColor: AppColors.neon,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: shape,
        ),
        onPressed: onPressed,
        child: Text(text, style: AppTextStyles.label.copyWith(color: AppColors.neon)),
      );
    }
  }
}
