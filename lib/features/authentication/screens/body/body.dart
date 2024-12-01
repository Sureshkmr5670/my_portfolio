// lib/features/authentication/screens/body/body.dart

import 'package:flutter/material.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/portfolio_model.dart';
import 'package:my_portfolio/features/authentication/screens/body/about.dart';
import 'package:my_portfolio/features/authentication/screens/body/skills.dart';

class SimpleBodyContainer extends StatelessWidget {
  final PortfolioModel portfolio;
  final int selectedIndex;

  const SimpleBodyContainer({
    Key? key,
    required this.portfolio,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.2, 0),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            )),
            child: child,
          ),
        );
      },
      child: _buildSelectedSection(selectedIndex),
    );
  }

  Widget _buildSelectedSection(int index) {
    // Using key to force AnimatedSwitcher to recognize the widget as different
    return KeyedSubtree(
      key: ValueKey<int>(index),
      child: index == 0
          ? AboutSection(portfolio: portfolio)
          : const SkillsSection(),
    );
  }
}
