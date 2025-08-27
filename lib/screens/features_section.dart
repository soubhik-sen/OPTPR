import 'package:flutter/material.dart';
import '../widgets/parallax_background.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/section_bg_image.dart';


class FeaturesSection extends StatelessWidget {
  final GlobalKey keyRef;
  final ValueNotifier<double> scroll;

  const FeaturesSection({super.key, required this.keyRef, required this.scroll});

  @override
  Widget build(BuildContext context) {
    return ParallaxBackground(
      sectionKey: keyRef,
      scrollNotifier: scroll,
      height: _responsiveHeight(context, minHeight: 720),
      
      background: Stack(
        fit: StackFit.expand,
        children:  [
          // Asset background image (replace with your real image)
          SectionBGImage("assets/images/features_bg.png"),
          DarkGreenGradient(overlay: HeadlightBeams()),
        ],
      ),
    
      foreground: const _FeaturesContent(),
    );
  }
}

class _FeaturesContent extends StatelessWidget {
  const _FeaturesContent();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("What you get", style: AppTextStyles.display),
              const SizedBox(height: 6),
              const Text("Utilization‑first optimizer with explainability", style: AppTextStyles.title),
              const SizedBox(height: 22),
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 900;
                  final crossAxisCount = isWide ? 3 : 1;
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: isWide ? 1.35 : 1.1,
                    children: const [
                      _FeatureCard(
                        title: "Own‑fleet assignment",
                        body: "Objective balances rolling time, empty miles, and on‑time service rate.",
                        icon: Icons.local_shipping,
                      ),
                      _FeatureCard(
                        title: "Rule cleanse (pre‑solve)",
                        body: "Remove impurities & incompatibilities before optimization; hard/soft constraints with severity.",
                        icon: Icons.rule,
                      ),
                      _FeatureCard(
                        title: "Explainable & logged",
                        body: "Every rule hit, penalty, and decision is logged for audits and tuning.",
                        icon: Icons.fact_check,
                      ),
                      _FeatureCard(
                        title: "AI optional",
                        body: "AI is OFF by default. Enable gradually with a slider that blends AI vs classic heuristics.",
                        icon: Icons.tune,
                      ),
                      _FeatureCard(
                        title: "SAP TM or standalone",
                        body: "Friendly with VSR/external loops; or use our API‑first service directly.",
                        icon: Icons.link,
                      ),
                      _FeatureCard(
                        title: "What‑if scenarios",
                        body: "Adjust weights & rules to compare outcomes before committing to a plan.",
                        icon: Icons.auto_graph,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              const _AISliderDemo(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String title;
  final String body;
  final IconData icon;
  const _FeatureCard({required this.title, required this.body, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.panel.withOpacity(0.65),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neon.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.neon),
          const SizedBox(height: 12),
          Text(title, style: AppTextStyles.title),
          const SizedBox(height: 8),
          Text(body, style: AppTextStyles.body),
        ],
      ),
    );
  }
}

class _AISliderDemo extends StatefulWidget {
  const _AISliderDemo();

  @override
  State<_AISliderDemo> createState() => _AISliderDemoState();
}

class _AISliderDemoState extends State<_AISliderDemo> {
  double value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.panel.withOpacity(0.6),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.neon.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("AI vs Traditional", style: AppTextStyles.title),
          const SizedBox(height: 8),
          Text(
            value < 0.01
                ? "Traditional only — AI disabled (recommended to start)"
                : value < 0.5
                    ? "Mostly traditional — small AI hints"
                    : value < 0.9
                        ? "Balanced blend — AI assists decisions"
                        : "AI leaning — requires user confidence",
            style: AppTextStyles.body,
          ),
          Slider(value: value, onChanged: (v) => setState(() => value = v)),
        ],
      ),
    );
  }
}
double _responsiveHeight(BuildContext context, {double minHeight = 640}) {
  final h = MediaQuery.of(context).size.height;
  return h > minHeight ? h : minHeight;
}

