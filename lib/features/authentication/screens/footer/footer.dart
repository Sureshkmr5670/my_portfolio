import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/device/device_utility.dart';
import 'package:my_portfolio/utils/theme/custom_styles/custom_padding.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.horizontalXXL,
      child: Container(
        width: DeviceUtils.getScreenWidth(),
        height: 60, 
        // color: Colors.purpleAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  Lottie.asset('assets/lottie/json/whatsapp.json'),
            // Lottie.asset('assets/lottie/json/linkedin.json'),
           // Lottie.asset('assets/lottie/json/github.json'),
          ],
        ),
      ),
    );
  }
}
