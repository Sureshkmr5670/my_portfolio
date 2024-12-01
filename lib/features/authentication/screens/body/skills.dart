
import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/device/device_utility.dart';
import 'package:my_portfolio/utils/theme/custom_styles/custom_padding.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CustomPadding.horizontalXXL,
      child: Container(
        height: DeviceUtils.getScreenHeight() - (DeviceUtils.getAppBarHeight() + 60),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildSkillCard(
              context,
              'Flutter',
              'Mobile & Web Development',
              Icons.flutter_dash,
              Colors.blue,
            ),
            _buildSkillCard(
              context,
              'Dart',
              'Programming Language',
              Icons.code,
              Colors.teal,
            ),
            _buildSkillCard(
              context,
              'MSD',
              'System Design',
              Icons.architecture,
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCard(
    BuildContext context,
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
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}