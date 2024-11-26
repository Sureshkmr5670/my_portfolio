import 'package:my_portfolio/features/authentication/models/portfolio/contact_model.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/experience_model.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/project_model.dart';
import 'package:my_portfolio/features/authentication/models/portfolio/skill_model.dart';

import '../base_model.dart';

class PortfolioModel extends BaseModel {
  final String firstName;
  final String lastName;
  final String role;
  final String summary;
  final List<SkillModel> skills;
  final List<ExperienceModel> experiences;
  final List<ProjectModel> projects;
  final ContactModel contact;

  PortfolioModel({
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.summary,
    required this.skills,
    required this.experiences,
    required this.projects,
    required this.contact,
  });

  String get fullName => '$firstName $lastName';

  @override
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'summary': summary,
      'skills': skills.map((skill) => skill.toJson()).toList(),
      'experiences': experiences.map((exp) => exp.toJson()).toList(),
      'projects': projects.map((project) => project.toJson()).toList(),
      'contact': contact.toJson(),
    };
  }

  factory PortfolioModel.fromJson(Map<String, dynamic> json) {
    return PortfolioModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      role: json['role'] ?? '',
      summary: json['summary'] ?? '',
      skills: (json['skills'] as List?)
              ?.map((skill) => SkillModel.fromJson(skill))
              .toList() ??
          [],
      experiences: (json['experiences'] as List?)
              ?.map((exp) => ExperienceModel.fromJson(exp))
              .toList() ??
          [],
      projects: (json['projects'] as List?)
              ?.map((project) => ProjectModel.fromJson(project))
              .toList() ??
          [],
      contact: ContactModel.fromJson(json['contact'] ?? {}),
    );
  }
}
