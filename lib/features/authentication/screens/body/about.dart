import 'package:flutter/material.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/portfolio_model.dart';
import 'package:my_portfolio/utils/device/device_utility.dart';
import 'package:my_portfolio/utils/theme/custom_styles/custom_padding.dart';

class AboutSection extends StatelessWidget {
  final PortfolioModel portfolio;

  const AboutSection({
    Key? key,
    required this.portfolio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.horizontalXXL,
      child: Container(
          height: DeviceUtils.getScreenHeight() -
              (DeviceUtils.getAppBarHeight() + 60),
          width: DeviceUtils.getScreenWidth(),
          child: Container(
            color: Colors.white,
            width: 200,
            height: 200,
          )),
    );
  }
}
