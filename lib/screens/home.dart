import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'hero_section.dart';
import 'problem_section.dart';
import 'solution_section.dart';
import 'features_section.dart';
import 'team_section.dart';
import 'pricing_section.dart';
import 'contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = ScrollController();
  final _scrollValue = ValueNotifier<double>(0);

  final _heroKey = GlobalKey();
  final _problemKey = GlobalKey();
  final _solutionKey = GlobalKey();
  final _featuresKey = GlobalKey();
  final _teamKey = GlobalKey();
  final _pricingKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() { _scrollValue.value = _scrollController.offset; });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _scrollValue.dispose();
    super.dispose();
  }

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: AppBar(
        backgroundColor: AppColors.bg.withOpacity(0.85),
        elevation: 0,
        title: const Text("FLEET OPTIMIZER", style: TextStyle(letterSpacing: 1.2)),
        actions: [
          _NavButton("Problem", () => _scrollTo(_problemKey)),
          _NavButton("Solution", () => _scrollTo(_solutionKey)),
          _NavButton("Features", () => _scrollTo(_featuresKey)),
          _NavButton("Team", () => _scrollTo(_teamKey)),
          _NavButton("Pricing", () => _scrollTo(_pricingKey)),
          _NavButton("Contact", () => _scrollTo(_contactKey)),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          KeyedSubtree(
            key: _heroKey,
            child: HeroSection(
              keyRef: _heroKey,
              scroll: _scrollValue,
              onSeeFeatures: () => _scrollTo(_featuresKey),
              onContact: () => _scrollTo(_pricingKey),
            ),
          ),
          KeyedSubtree(key: _problemKey, child: ProblemSection(keyRef: _problemKey, scroll: _scrollValue)),
          KeyedSubtree(key: _solutionKey, child: SolutionSection(keyRef: _solutionKey, scroll: _scrollValue)),
          KeyedSubtree(key: _featuresKey, child: FeaturesSection(keyRef: _featuresKey, scroll: _scrollValue)),
          KeyedSubtree(key: _teamKey, child: TeamSection(keyRef: _teamKey, scroll: _scrollValue)),
          KeyedSubtree(key: _pricingKey, child: PricingSection(keyRef: _pricingKey, scroll: _scrollValue)),
          KeyedSubtree(key: _contactKey, child: ContactSection(keyRef: _contactKey, scroll: _scrollValue)),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavButton(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(label, style: const TextStyle(color: Colors.white70)),
    );
  }
}
