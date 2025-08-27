import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/parallax_background.dart';
import '../widgets/section_container.dart';
import '../widgets/section_bg_image.dart';


class HeroSection extends StatelessWidget {
  final GlobalKey keyRef;
  final ValueNotifier<double> scroll;
  final VoidCallback onSeeFeatures;
  final VoidCallback onContact;

  const HeroSection({
    super.key,
    required this.keyRef,
    required this.scroll,
    required this.onSeeFeatures,
    required this.onContact,
  });

  @override
  Widget build(BuildContext context) {
    return ParallaxBackground(
      sectionKey: keyRef,
      scrollNotifier: scroll,
      height: _heroHeight(context),
      
      background: Stack(
        fit: StackFit.expand,
        children:  [
          // Asset background image (replace with your real image)
          SectionBGImage("assets/images/hero_bg.png"),
          DarkGreenGradient(overlay: HeadlightBeams()),
        ],
      ),
    
      foreground: SectionContent(
        title: "Keep your own fleet always moving",
        subtitle: "Minimize empty miles • Maximize service rate",
        body:
            "Built for shippers with their OWN trucks. Continuously assigns trucks to orders to keep wheels turning, "
            "while cutting empty distance and honoring service commitments. Integrates with your stack or SAP TM; also runs stand‑alone.",
        actions: [
          PrimaryButton(text: "How it works", onPressed: onSeeFeatures, filled: true),
          PrimaryButton(text: "Plans & pricing", onPressed: onContact, filled: false),
        ],
        align: CrossAxisAlignment.start,
        padding: const EdgeInsets.fromLTRB(20, 80, 20, 80),
      ),
    );
  }

  double _heroHeight(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return h.clamp(620, 900);
  }
}
