import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/common/widgets/frosted_glass_box.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/portfolio_model.dart';
import 'package:my_portfolio/utils/device/device_utility.dart';
import 'package:my_portfolio/utils/theme/custom_styles/custom_padding.dart';
import 'package:my_portfolio/utils/theme/custom_styles/sizes.dart';

class AboutSection extends StatelessWidget {
  final PortfolioModel portfolio;

  const AboutSection({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = DeviceUtils.getScreenWidth();
    double screenHeight = DeviceUtils.getScreenHeight();
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
              direction: screenWidth < 800 ? Axis.vertical : Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
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
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Say Hello!',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double maxWidth = constraints.maxWidth;
                        double maxHeight = constraints.maxHeight;
                        double imageWidth = 500;
                        double imageHeight = 500;

                        // Calculate the aspect ratio of the image
                        double aspectRatio = imageWidth / imageHeight;

                        // Adjust the image size to fit the available space
                        if (maxWidth / maxHeight > aspectRatio) {
                          imageHeight = maxHeight;
                          imageWidth = maxHeight * aspectRatio;
                        } else {
                          imageWidth = maxWidth;
                          imageHeight = maxWidth / aspectRatio;
                        }

                        return LottieBuilder.asset(
                          'assets/lottie/json/multiplatform_coding.json',
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
