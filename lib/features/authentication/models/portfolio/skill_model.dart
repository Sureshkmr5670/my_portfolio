import '../base_model.dart';

class SkillModel extends BaseModel {
  final String name;
  final int proficiencyLevel; // 1-5
  final String category;

  SkillModel({
    required this.name,
    required this.proficiencyLevel,
    required this.category,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'proficiencyLevel': proficiencyLevel,
      'category': category,
    };
  }

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] ?? '',
      proficiencyLevel: json['proficiencyLevel'] ?? 1,
      category: json['category'] ?? '',
    );
  }
}
