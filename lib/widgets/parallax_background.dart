import 'dart:math' as math;
import 'package:flutter/material.dart';

class ParallaxBackground extends StatelessWidget {
  final GlobalKey sectionKey;
  final ValueNotifier<double> scrollNotifier;
  final double height;
  final Widget background;
  final Widget foreground;

  const ParallaxBackground({
    super.key,
    required this.sectionKey,
    required this.scrollNotifier,
    required this.height,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ValueListenableBuilder<double>(
            valueListenable: scrollNotifier,
            builder: (context, _, __) {
              final box = sectionKey.currentContext?.findRenderObject() as RenderBox?;
              double dy = 0;
              double viewportH = MediaQuery.of(context).size.height;
              if (box != null && box.hasSize) {
                final pos = box.localToGlobal(box.size.centerLeft(Offset.zero));
                dy = pos.dy;
              }
              final center = viewportH / 2;
              final normalized = ((dy - center) / center).clamp(-1.0, 1.0);
              final translateY = -normalized * 40;
              return Transform.translate(
                offset: Offset(0, translateY),
                child: background,
              );
            },
          ),
          foreground,
        ],
      ),
    );
  }
}

class DarkGreenGradient extends StatelessWidget {
  final Alignment begin;
  final Alignment end;
  final List<Color> colors;
  final Widget? overlay;

  const DarkGreenGradient({
    super.key,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.colors = const [
      Color(0xFF0E1714),
      Color(0xFF0A1411),
      Color(0xFF090D0C),
    ],
    this.overlay,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: begin, end: end, colors: colors),
      ),
      child: overlay ?? const SizedBox.expand(),
    );
  }
}

class HeadlightBeams extends StatelessWidget {
  const HeadlightBeams({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: -80, bottom: -40, child: _beam()),
        Positioned(right: -80, bottom: -40, child: _beam()),
        Positioned.fill(child: _gridOverlay()),
      ],
    );
  }

  Widget _beam() {
    return Transform.rotate(
      angle: -math.pi / 12,
      child: Container(
        width: 260,
        height: 420,
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            radius: 0.8,
            colors: [Color(0x66FFFFFF), Color(0x00FFFFFF)],
          ),
        ),
      ),
    );
  }

  Widget _gridOverlay() {
    return CustomPaint(painter: _GridPainter());
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0x10FFFFFF)..strokeWidth = 1;
    const gap = 32.0;
    for (double x = 0; x < size.width; x += gap) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += gap) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
