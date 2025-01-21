import 'package:my_portfolio/features/authentication/models/portfolio/contact_model.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/experience_model.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/project_model.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/skill_model.dart';

import '../../features/authentication/models/portfolio/portfolio_model.dart';

class PortfolioService {
  Future<PortfolioModel> getPortfolioData() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));

    return PortfolioModel(
      firstName: 'Suresh',
      lastName: 'Kumar',
      role: 'Software Engineer',
      summary: 'Software Engineer with 1 year of experience in full-stack development, specializing in Flutter for web and mobile applications built with clean architecture. Proficient in developing APIs using Spring Boot and experienced in Microsoft Dynamics to create end-to-end solutions. Adept at integrating front-end and back-end components to deliver seamless and high-performance applications. Passionate about contributing to innovative projects and continuously enhancing technical expertise',
      skills: [
        SkillModel(
          name: 'Flutter',
          proficiencyLevel: 3,
          category: 'Mobile Development',
        ),
        SkillModel(
          name: 'Dart',
          proficiencyLevel: 3,
          category: 'Programming Languages',
        ),
        // Add more skills...
      ],
      experiences: [
        ExperienceModel(
          company: 'Tech Corp',
          position: 'Senior Flutter Developer',
          duration: '2020 - Present',
          responsibilities: [
            'Led team of 5 developers',
            'Developed enterprise apps',
          ],
        ),
        // Add more experiences...
      ],
      projects: [
        ProjectModel(
          name: 'E-commerce App',
          description: 'A full-featured shopping application',
          technologies: ['Flutter', 'Firebase', 'REST API'],
        ),
        // Add more projects...
      ],
      contact: ContactModel(
        email: 'sureshkm45670@gmamil.com',
        phone: '+918870026247',
        location: 'Chennai, India',
      ),
    );
  }
}
