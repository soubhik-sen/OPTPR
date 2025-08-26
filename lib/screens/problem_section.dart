import 'package:flutter/material.dart';
import '../widgets/parallax_background.dart';
import '../widgets/section_container.dart';
import '../widgets/section_bg_image.dart';

class ProblemSection extends StatelessWidget {
  final GlobalKey keyRef;
  final ValueNotifier<double> scroll;

  const ProblemSection({super.key, required this.keyRef, required this.scroll});

  @override
  Widget build(BuildContext context) {
    return ParallaxBackground(
      sectionKey: keyRef,
      scrollNotifier: scroll,
      height: 640,
      
      background: Stack(
        fit: StackFit.expand,
        children: const [
          // Asset background image (replace with your real image)
          SectionBGImage("assets/images/problem_bg.png"),
          DarkGreenGradient(overlay: HeadlightBeams()),
        ],
      ),
    
      foreground: const SectionContent(
        title: "Traditional VSR ≠ Owned‑fleet utilization",
        subtitle: "Great routes don’t always mean busy trucks",
        body:
            "Most tools optimize routes across a mixed carrier pool. If you own the trucks, the real goal is to keep them productively assigned all day, "
            "minimizing empty legs while meeting time windows. Spreadsheets and manual tweaks leak utilization and service rate when volumes spike.",
        actions: [],
        align: CrossAxisAlignment.start,
      ),
    );
  }
}
