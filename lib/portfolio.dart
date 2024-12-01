import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/common/widgets/error.dart';
import 'package:my_portfolio/features/authentication/controllers/navigation_index.dart';
import 'package:my_portfolio/features/authentication/controllers/portfolio_provider.dart';
import 'package:my_portfolio/features/authentication/screens/body/body.dart';
import 'package:my_portfolio/features/authentication/screens/header/header.dart';
import 'package:my_portfolio/features/authentication/screens/loading/loading_screen.dart';
import 'package:provider/provider.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _bounceController;
  double _scroll = 0.0;
  bool _showBody = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);
  }

  void _onScroll() {
    setState(() {
      _scroll = _scrollController.offset;
      if (_scroll > 50) {
        _showBody = true;
      } else {
        _showBody = false;
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<PortfolioProvider>(
        builder: (context, portfolioProvider, _) {
          if (portfolioProvider.isLoading) {
            return const LoadingScreen();
          }

          if (portfolioProvider.hasError) {
            return ErrorScreen(
              error: portfolioProvider.error!,
              onRetry: () => portfolioProvider.refreshData(),
            );
          }

          if (!portfolioProvider.hasData) {
            return const Center(
              child: Text('No portfolio data available'),
            );
          }

          final portfolio = portfolioProvider.portfolioData!;

          return Stack(
            children: [
              // Fullscreen Lottie Animation
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: _showBody ? 0.0 : 1.0,
                child: SizedBox.expand(
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(0, _scroll * 0.5),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double width = constraints.maxWidth;
                          double height = constraints.maxHeight;
                          double dimension = width > height ? width : height;

                          return SizedBox(
                            width: dimension,
                            height: dimension,
                            child: LottieBuilder.asset(
                              'assets/lottie/json/coding_coffee_cup.json',
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              // Scrollable Content
              SingleChildScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    // Spacer to allow scrolling
                    SizedBox(height: size.height),

                    // Body Content
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutCubic,
                      offset: _showBody ? Offset.zero : const Offset(0, 0.2),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 800),
                        opacity: _showBody ? 1.0 : 0.0,
                        child: Container(
                          constraints: BoxConstraints(
                            minHeight: size.height,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.05),
                              ],
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            child: Column(
                              children: [
                                HeaderSection(portfolio: portfolio
                                ),
                                SimpleBodyContainer(
                                  portfolio: portfolio,
                                  selectedIndex:
                                      Provider.of<NavigationProvider>(context)
                                          .selectedIndex,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bouncing Arrow
              // Bouncing Arrow
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: _showBody ? 0.0 : 1.0,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, -0.1),
                      end: const Offset(0, 0.1),
                    ).animate(CurvedAnimation(
                      parent: _bounceController,
                      curve: Curves.easeInOut,
                    )),
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            'Scroll down',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 40,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _scrollController.animateTo(
                                size.height,
                                duration: const Duration(milliseconds: 800),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
