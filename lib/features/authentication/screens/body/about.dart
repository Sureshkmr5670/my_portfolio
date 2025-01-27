import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/common/widgets/frosted_glass_box.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/portfolio_model.dart';
import 'package:my_portfolio/utils/device/device_utility.dart';
import 'package:my_portfolio/utils/theme/custom_styles/custom_padding.dart';
import 'package:my_portfolio/utils/theme/custom_styles/sizes.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  final PortfolioModel portfolio;

  const AboutSection({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  Future<void> _downloadResume() async {
    final url =
        'https://drive.google.com/file/d/1-Mzk0Wk2J5lElBRz6KWG2atrOXihOFh0/view?usp=sharing'; // Replace with your actual resume URL

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode
            .externalApplication, // Opens in a browser or downloads if supported
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth();
    double screenHeight = DeviceUtils.getScreenHeight();
    bool isMobile = screenWidth < 800; // Define a breakpoint for mobile devices

    return Padding(
      padding: CustomPadding.horizontalXXL,
      child: Container(
        height: screenHeight - (DeviceUtils.getAppBarHeight() + 60),
        width: screenWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(CustomSizes.borderRadiusLg),
          child: GlassBox(
            width: screenWidth * 0.8,
            height: screenHeight * 0.7,
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!isMobile)
                  Flexible(
                    flex: 1,
                    child: _buildTextContent(context),
                  ),
                Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LottieBuilder.asset(
                      'assets/lottie/json/multiplatform_coding.json',
                      fit: BoxFit.contain,
                      width: isMobile ? screenWidth * 0.6 : null,
                      height: isMobile ? screenHeight * 0.4 : null,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Text('Error loading animation'),
                        );
                      },
                    ),
                  ),
                ),
                if (isMobile) _buildTextContent(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello, I'm ${portfolio.firstName} ${portfolio.lastName}",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            portfolio.role,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            portfolio.summary,
            overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  height: 1.5, // Line height
                  letterSpacing: 1.2, // Letter spacing
                ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _downloadResume,
                child: Text(
                  'Get My Resume!',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
