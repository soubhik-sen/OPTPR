import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const display = TextStyle(
    fontSize: 44,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
    height: 1.1,
    letterSpacing: -0.5,
  );
  static const headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
    height: 1.2,
  );
  static const title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
  static const body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textDim,
    height: 1.5,
  );
  static const label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
}
