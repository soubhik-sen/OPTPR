import 'package:flutter/material.dart';
import '../widgets/parallax_background.dart';
import '../widgets/section_container.dart';
import '../widgets/section_bg_image.dart';

class TeamSection extends StatelessWidget {
  final GlobalKey keyRef;
  final ValueNotifier<double> scroll;

  const TeamSection({super.key, required this.keyRef, required this.scroll});

  @override
  Widget build(BuildContext context) {
    return ParallaxBackground(
      sectionKey: keyRef,
      scrollNotifier: scroll,
      height: 560,
      
      background: Stack(
        fit: StackFit.expand,
        children:  [
          // Asset background image (replace with your real image)
          SectionBGImage("assets/images/team_bg.png"),
          const DarkGreenGradient(overlay: HeadlightBeams()),
        ],
      ),
    
      foreground: const SectionContent(
        title: "Built by operators for operators",
        subtitle: "SAP TM natives, ABAP + Python, real‑world depots",
        body:
            "We’ve planned real fleets, integrated with TM, and lived through peak season chaos. "
            "This product is our distilled playbook — pragmatic, explainable optimization your team can adopt.",
        actions: [],
        align: CrossAxisAlignment.start,
      ),
    );
  }
}
