import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/portfolio_model.dart';
import 'package:my_portfolio/utils/device/responsive.dart';
import 'package:my_portfolio/utils/theme/custom_styles/custom_padding.dart';
import 'package:my_portfolio/utils/theme/custom_styles/custom_spacing.dart';

class AnimatedBodyContainer extends StatefulWidget {
  final PortfolioModel portfolio;
  final int selectedIndex;

  const AnimatedBodyContainer({
    Key? key,
    required this.portfolio,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<AnimatedBodyContainer> createState() => _AnimatedBodyContainerState();
}

class _AnimatedBodyContainerState extends State<AnimatedBodyContainer> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    
    // Single controller for both sections
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Fade and slide animations
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 0.1),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(AnimatedBodyContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      _animationController.forward(from: 0.0);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.selectedIndex == 0
          ? AboutSection(portfolio: widget.portfolio)
          : SkillsSection(),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  final PortfolioModel portfolio;

  const AboutSection({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobileOrTablet = Responsive.isMobile(context) || Responsive.isTablet(context);
        
        return SingleChildScrollView(
          child: Padding(
            padding: CustomPadding.horizontalXXL,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxWidth: constraints.maxWidth,
              ),
              child: isMobileOrTablet
                ? _buildVerticalLayout(context)
                : _buildHorizontalLayout(context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: _buildLeftContent(context),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _buildRightContent(context),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLeftContent(context),
        const SizedBox(height: 24),
        _buildRightContent(context),
      ],
    );
  }

  Widget _buildLeftContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello,\nI\'m ${portfolio.firstName} ${portfolio.lastName}',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          portfolio.role,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        CustomSpacing.contentItemSpacing,
        const Row(
          children: [
            Text('Hire Me!'),
            Icon(Icons.arrow_right),
          ],
        )
      ],
    );
  }

  Widget _buildRightContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Expertise on',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          portfolio.summary,
          style: Theme.of(context).textTheme.bodyMedium,
          softWrap: true,
        ),
        Row(
          children: [
            Text('Download CV', style: Theme.of(context).textTheme.bodyMedium),
            Icon(Icons.file_download, size: 5.sp),
          ],
        )
      ],
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: CustomPadding.horizontalXXL,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                maxWidth: constraints.maxWidth,
              ),
              child: Responsive.isMobile(context) || Responsive.isTablet(context)
                ? _buildVerticalSkillsLayout()
                : _buildHorizontalSkillsLayout(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalSkillsLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildSkillCards(),
    );
  }

  Widget _buildVerticalSkillsLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildSkillCards(),
    );
  }

  List<Widget> _buildSkillCards() {
    return [
      _buildSkillCard(
        'Flutter',
        'Mobile & Web Development',
        Icons.flutter_dash,
        Colors.blue,
      ),
      _buildSkillCard(
        'Dart',
        'Programming Language',
        Icons.code,
        Colors.teal,
      ),
      _buildSkillCard(
        'MSD',
        'System Design',
        Icons.architecture,
        Colors.purple,
      ),
    ];
  }

  Widget _buildSkillCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}