import '../base_model.dart';

class ExperienceModel extends BaseModel {
  final String company;
  final String position;
  final String duration;
  final List<String> responsibilities;

  ExperienceModel({
    required this.company,
    required this.position,
    required this.duration,
    required this.responsibilities,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'position': position,
      'duration': duration,
      'responsibilities': responsibilities,
    };
  }

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      company: json['company'] ?? '',
      position: json['position'] ?? '',
      duration: json['duration'] ?? '',
      responsibilities: List<String>.from(json['responsibilities'] ?? []),
    );
  }
}
