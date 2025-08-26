import 'package:flutter/material.dart';
import '../widgets/parallax_background.dart';
import '../widgets/section_container.dart';
import '../widgets/section_bg_image.dart';

class SolutionSection extends StatelessWidget {
  final GlobalKey keyRef;
  final ValueNotifier<double> scroll;

  const SolutionSection({super.key, required this.keyRef, required this.scroll});

  @override
  Widget build(BuildContext context) {
    return ParallaxBackground(
      sectionKey: keyRef,
      scrollNotifier: scroll,
      height: 720,
      
      background: Stack(
        fit: StackFit.expand,
        children: const [
          // Asset background image (replace with your real image)
          SectionBGImage("assets/images/solution_bg.png"),
          DarkGreenGradient(overlay: HeadlightBeams()),
        ],
      ),
    
      foreground: const SectionContent(
        title: "Purpose‑built for owned fleets",
        subtitle: "Assignment engine + pre‑optimization rule cleanse + full audit trail",
        body: 
            "• Assignment objective: maximize rolling time of your trucks while minimizing empty repositions."
            "• Pre‑optimization rule engine: remove impurities and incompatibilities before solving (geo, product mix, equipment fit, SLAs, driver limits)."
            "• Transparent logs: every decision and rule application is recorded for analysis and fine‑tuning."
            "• Two modes: Lean Flow (truck → pre‑sequenced orders) and Full Flow (compose & sequence routes).",
        actions: [],
        align: CrossAxisAlignment.start,
      ),
    );
  }
}
