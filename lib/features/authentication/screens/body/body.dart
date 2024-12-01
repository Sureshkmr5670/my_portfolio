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
    return Stack(
      children: [
        // About Section
        if (selectedIndex == 0)
          AboutSection(portfolio: portfolio),
        // Skills Section
        if (selectedIndex == 1)
          SkillsSection(),
      ],
    );
  }
}

