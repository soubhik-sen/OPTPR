import 'package:flutter/material.dart';
import '../widgets/parallax_background.dart';
import '../widgets/custom_button.dart';
import '../theme/app_text_styles.dart';
import '../widgets/section_bg_image.dart';


class ContactSection extends StatelessWidget {
  final GlobalKey keyRef;
  final ValueNotifier<double> scroll;

  const ContactSection({super.key, required this.keyRef, required this.scroll});

  @override
  Widget build(BuildContext context) {
    return ParallaxBackground(
      sectionKey: keyRef,
      scrollNotifier: scroll,
      height: _responsiveHeight(context, minHeight: 720),
      
      background: Stack(
        fit: StackFit.expand,
        children: const [
          // Asset background image (replace with your real image)
          SectionBGImage("assets/images/contact_bg.png"),
          DarkGreenGradient(overlay: HeadlightBeams()),
        ],
      ),
    
      foreground: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Talk to us", style: AppTextStyles.display, textAlign: TextAlign.center),
                const SizedBox(height: 10),
                const Text(
                  "Share your lanes, fleet size, and constraints. We'll propose a pilot and ROI model.",
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    PrimaryButton(
                      text: "Email sales",
                      onPressed: () { launchUrlString("mailto:sales@example.com?subject=Fleet%20Optimizer%20Pilot"); },
                      filled: true,
                    ),
                    PrimaryButton(
                      text: "Book a demo",
                      onPressed: () { launchUrlString("https://cal.com/"); },
                      filled: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void launchUrlString(String url) { debugPrint("Open URL: $url"); }

double _responsiveHeight(BuildContext context, {double minHeight = 640}) {
  final h = MediaQuery.of(context).size.height;
  return h > minHeight ? h : minHeight;
}

