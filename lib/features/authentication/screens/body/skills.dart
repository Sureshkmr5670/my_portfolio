import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/constants/image_strings.dart';
import 'package:my_portfolio/utils/device/responsive.dart';

// void main(){
//   runApp(GetMaterialApp(home: Scaffold(body: SkillsSection())));
// }
class SkillsSection extends StatefulWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  _SkillsSectionState createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    bool isMobileDevice =
        Responsive.isMobile(context) || Responsive.isMobileLarge(context);
    bool isTabletDevice =
        Responsive.isTablet(context) || Responsive.isTabletLarge(context);

    bool isVerticalLayout = isMobileDevice || isTabletDevice;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobileDevice ? 20 : 50),
      child: Column(
        children: [
          SizedBox(
            height: isMobileDevice
                ? MediaQuery.of(context).size.height * 0.9
                : isTabletDevice
                    ? MediaQuery.of(context).size.height * 0.8
                    : MediaQuery.of(context).size.height * 0.7,
            child: isVerticalLayout
                ? SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: _buildSkillCard(
                            context,
                            index,
                            _getSkillDetails(index),
                            _hoveredIndex == index,
                          ),
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      4,
                      (index) => _buildSkillCard(
                        context,
                        index,
                        _getSkillDetails(index),
                        _hoveredIndex == index,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(
    BuildContext context,
    int index,
    SkillDetail skill,
    bool isHovered,
  ) {
    bool isMobileDevice =
        Responsive.isMobile(context) || Responsive.isMobileLarge(context);
    bool isTabletDevice =
        Responsive.isTablet(context) || Responsive.isTabletLarge(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          _hoveredIndex = _hoveredIndex == index ? null : index;
        });
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _hoveredIndex = index),
        onExit: (_) => setState(() => _hoveredIndex = null),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isMobileDevice
              ? MediaQuery.of(context).size.width * 0.9
              : isTabletDevice
                  ? MediaQuery.of(context).size.width * 0.8
                  : (isHovered ? 400 : 300),
          height: isMobileDevice
              ? 400
              : isTabletDevice
                  ? 400
                  : (isHovered ? 500 : 350),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: isHovered ? 20 : 10,
                offset: Offset(0, isHovered ? 10 : 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: skill.image, width: 400, height: 100),
              const SizedBox(height: 16),
              Text(
                skill.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: skill.color,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  skill.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              if (isHovered || isMobileDevice || isTabletDevice) ...[
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    skill.detailedDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  SkillDetail _getSkillDetails(int index) {
    switch (index) {
      case 0:
        return const SkillDetail(
          title: 'Flutter & Dart',
          description: 'Mobile & Web Development',
          detailedDescription:
              'Developed a high-performance application called "Collection" '
              'for managing DPD loans from banks, delivering a seamless experience '
              'on Android platforms. Prior to development, a user-friendly UI '
              'was meticulously designed using Figma. Additionally, created a fully '
              'responsive web application for Equitas Bank’s Interactive Statement, '
              'enabling users to view and interact with their bank statements effortlessly.',
          image: AssetImage(ImageStrings.Logo_dart_flutter),
          color: Colors.blue,
        );
      case 1:
        return const SkillDetail(
          title: 'React JS',
          description: 'Full Stack Development',
          detailedDescription:
              'Built a robust full-stack food-ordering application using React JS '
              'and Firebase for backend. The app integrates Firebase Authentication '
              'for secure sign-in and sign-up, offering a smooth and interactive '
              'experience for users.',
          image: AssetImage(ImageStrings.Logo_js_React),
          color: Colors.green,
        );
      case 2:
        return const SkillDetail(
          title: 'Java & Spring Boot',
          description: 'Backend Development',
          detailedDescription:
              'Proficient in core Java concepts like OOP, Collections, and Multi-threading. '
              'Developed APIs for the "Collection" application, implementing secure role-based '
              'authentication using Spring Security, JWT, and MySQL. Delivered efficient backend '
              'solutions to handle complex business logic.',
          image: const AssetImage(ImageStrings.Logo_java_springboot),
          color: Colors.orange,
        );
      case 3:
        return const SkillDetail(
          title: 'Microsoft Dynamics',
          description: 'CRM & Business Application Development',
          detailedDescription:
              'Currently leading the development of Gold Loan and PL applications for Equitas Bank '
              'using Microsoft Dynamics. Expertise includes creating intuitive front-end applications '
              'with PowerApps Canvas using Power Fx language, designing efficient APIs through Power Automate, '
              'and managing complex workflows within the Dynamics ecosystem. Skilled in Model-Driven App '
              'development and flow automation for scalable solutions.',
          image: AssetImage(ImageStrings.Logo_powerapps_powerautomate),
          color: Colors.purple,
        );
      default:
        throw ArgumentError('Invalid skill index');
    }
  }
}

class SkillDetail {
  final String title;
  final String description;
  final String detailedDescription;
  final ImageProvider image;
  final Color color;

  const SkillDetail({
    required this.title,
    required this.description,
    required this.detailedDescription,
    required this.image,
    required this.color,
  });
}
