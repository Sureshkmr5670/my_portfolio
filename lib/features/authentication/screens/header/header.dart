import 'package:flutter/material.dart';
import 'package:my_portfolio/features/authentication/controllers/navigation_index.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/portfolio_model.dart';
import 'package:my_portfolio/utils/device/device_utility.dart';
import 'package:my_portfolio/utils/device/responsive.dart';
import 'package:my_portfolio/utils/theme/custom_styles/custom_padding.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatefulWidget {
  final PortfolioModel portfolio;

  const HeaderSection({super.key, required this.portfolio});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  final List<String> navItems = ['About', 'Skills', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return Padding(
      padding: CustomPadding.screenPadding,
      child: Container(
        height: DeviceUtils.getAppBarHeight(),
        child: Column(
          children: [
            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(navItems.length, (index) {
                return GestureDetector(
                  onTap: () {
                    navigationProvider
                        .updateIndex(index); // Update the provider
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        navItems[index],
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      // Active Indicator
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 4,
                        width:
                            navigationProvider.selectedIndex == index ? 40 : 0,
                        color: Colors.blue, // Change to your active color
                        margin: const EdgeInsets.only(top: 4),
                      ),
                    ],
                  ),
                );
              }),
            ),
            // User Info
          ],
        ),
      ),
    );
  }
}
