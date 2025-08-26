import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_colors.dart';

class SectionContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String body;
  final List<Widget> actions;
  final double maxWidth;
  final CrossAxisAlignment align;
  final EdgeInsetsGeometry padding;

  const SectionContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.body,
    this.actions = const [],
    this.maxWidth = 980,
    this.align = CrossAxisAlignment.start,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: padding,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: align,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: AppTextStyles.display),
              const SizedBox(height: 12),
              Text(subtitle, style: AppTextStyles.title.copyWith(color: AppColors.neon)),
              const SizedBox(height: 18),
              Text(body, style: AppTextStyles.body),
              if (actions.isNotEmpty) const SizedBox(height: 20),
              if (actions.isNotEmpty)
                Wrap(spacing: 12, runSpacing: 12, children: actions),
            ],
          ),
        ),
      ),
    );
  }
}
