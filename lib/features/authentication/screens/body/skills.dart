import 'package:flutter/material.dart';
import 'package:my_portfolio/utils/device/responsive.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  _SkillsSectionState createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  int? _hoveredIndex;

  @override
  Widget build(BuildContext context) {
    bool isMobileDevice = Responsive.isMobile(context) || Responsive.isMobileLarge(context);
    bool isTabletDevice = Responsive.isTablet(context) || Responsive.isTabletLarge(context);

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
            child: isMobileDevice || isTabletDevice
                ? SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        3,
                        (index) => Padding(
                          padding: EdgeInsets.only(bottom: 20),
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
                : Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                      3,
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
    bool isMobileDevice = Responsive.isMobile(context) || Responsive.isMobileLarge(context);
    bool isTabletDevice = Responsive.isTablet(context) || Responsive.isTabletLarge(context);

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
              ? 300
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
          // Rest of your card content remains the same
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(skill.icon, size: 64, color: skill.color),
              SizedBox(height: 16),
              Text(
                skill.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: skill.color,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  skill.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              if (isHovered || isMobileDevice || isTabletDevice) ...[
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
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
}

  SkillDetail _getSkillDetails(int index) {
    switch (index) {
      case 0:
        return SkillDetail(
          title: 'Flutter',
          description: 'Mobile & Web Development',
          detailedDescription:
              'Experienced in creating cross-platform applications '
              'with Flutter, utilizing efficient and performant code '
              'to deliver seamless user experiences.',
          icon: Icons.flutter_dash,
          color: Colors.blue,
        );
      case 1:
        return SkillDetail(
          title: 'Dart',
          description: 'Programming Language',
          detailedDescription: 'Proficient in Dart programming language, '
              'with strong understanding of object-oriented and functional '
              'programming paradigms.',
          icon: Icons.code,
          color: Colors.teal,
        );
      case 2:
        return SkillDetail(
          title: 'MSD',
          description: 'System Design',
          detailedDescription: 'Skilled in Modern System Design, capable of '
              'architecting scalable, robust, and efficient software solutions.',
          icon: Icons.architecture,
          color: Colors.purple,
        );
      default:
        throw ArgumentError('Invalid skill index');
    }
  }


class SkillDetail {
  final String title;
  final String description;
  final String detailedDescription;
  final IconData icon;
  final Color color;

  const SkillDetail({
    required this.title,
    required this.description,
    required this.detailedDescription,
    required this.icon,
    required this.color,
  });
}
