import 'package:flutter/material.dart';
import '../widgets/parallax_background.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../widgets/section_bg_image.dart';


class PricingSection extends StatelessWidget {
  final GlobalKey keyRef;
  final ValueNotifier<double> scroll;

  const PricingSection({super.key, required this.keyRef, required this.scroll});

  @override
  Widget build(BuildContext context) {
    return ParallaxBackground(
      sectionKey: keyRef,
      scrollNotifier: scroll,
      height: 760,
      
      background: Stack(
        fit: StackFit.expand,
        children:  [
          // Asset background image (replace with your real image)
          SectionBGImage("assets/images/pricing_bg.png"),
          DarkGreenGradient(overlay: HeadlightBeams()),
        ],
      ),
    
      foreground: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Plans & pricing", style: AppTextStyles.display),
                const SizedBox(height: 6),
                const Text("Start small. Scale with confidence.", style: AppTextStyles.title),
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
                      childAspectRatio: isWide ? 1.2 : 1.7,
                      children: const [
                        _PlanCard(
                          name: "Starter",
                          price: "€0",
                          period: "pilot",
                          bullets: [
                            "Up to 10 trucks",
                            "Daily assignment runs",
                            "Rule cleanse engine",
                            "Logs & explanations",
                            "Email support",
                          ],
                        ),
                        _PlanCard(
                          name: "Growth",
                          price: "€499",
                          period: "/month",
                          bullets: [
                            "Up to 50 trucks",
                            "Hourly runs + scenarios",
                            "SAP TM integration helpers",
                            "Priority support",
                            "Staging environment",
                          ],
                        ),
                        _PlanCard(
                          name: "Enterprise",
                          price: "Custom",
                          period: "",
                          bullets: [
                            "100+ trucks",
                            "SLA & SSO",
                            "On‑prem / VPC options",
                            "Advanced signals (AI)",
                            "Solution engineering",
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final String name;
  final String price;
  final String period;
  final List<String> bullets;
  const _PlanCard({required this.name, required this.price, required this.period, required this.bullets});

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
          Text(name, style: AppTextStyles.title),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: AppTextStyles.display.copyWith(fontSize: 36)),
              const SizedBox(width: 6),
              Text(period, style: AppTextStyles.body),
            ],
          ),
          const SizedBox(height: 12),
          ...bullets.map((b) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("•  ", style: AppTextStyles.body),
                Expanded(child: Text(b, style: AppTextStyles.body)),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
