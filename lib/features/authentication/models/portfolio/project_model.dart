import '../base_model.dart';

class ProjectModel extends BaseModel {
  final String name;
  final String description;
  final List<String> technologies;
  final String? imageUrl;
  final String? githubUrl;
  final String? liveUrl;
  final List<String> features;
  final DateTime? startDate;
  final DateTime? endDate;
  final ProjectStatus status;
  final String? clientName;

  ProjectModel({
    required this.name,
    required this.description,
    required this.technologies,
    this.imageUrl,
    this.githubUrl,
    this.liveUrl,
    this.features = const [],
    this.startDate,
    this.endDate,
    this.status = ProjectStatus.completed,
    this.clientName,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'technologies': technologies,
      'imageUrl': imageUrl,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
      'features': features,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'status': status.toString(),
      'clientName': clientName,
    };
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      technologies: List<String>.from(json['technologies'] ?? []),
      imageUrl: json['imageUrl'],
      githubUrl: json['githubUrl'],
      liveUrl: json['liveUrl'],
      features: List<String>.from(json['features'] ?? []),
      startDate: json['startDate'] != null 
          ? DateTime.parse(json['startDate'])
          : null,
      endDate: json['endDate'] != null 
          ? DateTime.parse(json['endDate'])
          : null,
      status: ProjectStatus.values.firstWhere(
        (e) => e.toString() == json['status'],
        orElse: () => ProjectStatus.completed,
      ),
      clientName: json['clientName'],
    );
  }

  ProjectModel copyWith({
    String? name,
    String? description,
    List<String>? technologies,
    String? imageUrl,
    String? githubUrl,
    String? liveUrl,
    List<String>? features,
    DateTime? startDate,
    DateTime? endDate,
    ProjectStatus? status,
    String? clientName,
  }) {
    return ProjectModel(
      name: name ?? this.name,
      description: description ?? this.description,
      technologies: technologies ?? this.technologies,
      imageUrl: imageUrl ?? this.imageUrl,
      githubUrl: githubUrl ?? this.githubUrl,
      liveUrl: liveUrl ?? this.liveUrl,
      features: features ?? this.features,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      clientName: clientName ?? this.clientName,
    );
  }

  @override
  List<String> validate() {
    final errors = <String>[];
    
    if (name.isEmpty) {
      errors.add('Project name is required');
    }
    if (description.isEmpty) {
      errors.add('Project description is required');
    }
    if (technologies.isEmpty) {
      errors.add('At least one technology must be specified');
    }
    if (startDate != null && endDate != null && startDate!.isAfter(endDate!)) {
      errors.add('Start date must be before end date');
    }
    
    return errors;
  }

  String get duration {
    if (startDate == null || endDate == null) return 'Ongoing';
    return '${startDate!.year}-${endDate!.year}';
  }
}

enum ProjectStatus {
  planning,
  inProgress,
  completed,
  maintenance
}
