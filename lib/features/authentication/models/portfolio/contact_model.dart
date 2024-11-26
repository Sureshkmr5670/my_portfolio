import '../base_model.dart';

class ContactModel extends BaseModel {
  final String email;
  final String? phone;
  final String? location;
  final SocialMediaLinks socialMedia;
  final String? website;
  final bool isAvailableForFreelance;
  final String? preferredContactMethod;
  final AvailabilityStatus availabilityStatus;
  final WorkingHours? workingHours;

  ContactModel({
    required this.email,
    this.phone,
    this.location,
    this.socialMedia = const SocialMediaLinks(),
    this.website,
    this.isAvailableForFreelance = false,
    this.preferredContactMethod,
    this.availabilityStatus = AvailabilityStatus.available,
    this.workingHours,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'location': location,
      'socialMedia': socialMedia.toJson(),
      'website': website,
      'isAvailableForFreelance': isAvailableForFreelance,
      'preferredContactMethod': preferredContactMethod,
      'availabilityStatus': availabilityStatus.toString(),
      'workingHours': workingHours?.toJson(),
    };
  }

  factory ContactModel.fromJson(Map<String, dynamic> json) {
    return ContactModel(
      email: json['email'] ?? '',
      phone: json['phone'],
      location: json['location'],
      socialMedia: SocialMediaLinks.fromJson(json['socialMedia'] ?? {}),
      website: json['website'],
      isAvailableForFreelance: json['isAvailableForFreelance'] ?? false,
      preferredContactMethod: json['preferredContactMethod'],
      availabilityStatus: AvailabilityStatus.values.firstWhere(
        (e) => e.toString() == json['availabilityStatus'],
        orElse: () => AvailabilityStatus.available,
      ),
      workingHours: json['workingHours'] != null
          ? WorkingHours.fromJson(json['workingHours'])
          : null,
    );
  }

  ContactModel copyWith({
    String? email,
    String? phone,
    String? location,
    SocialMediaLinks? socialMedia,
    String? website,
    bool? isAvailableForFreelance,
    String? preferredContactMethod,
    AvailabilityStatus? availabilityStatus,
    WorkingHours? workingHours,
  }) {
    return ContactModel(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      socialMedia: socialMedia ?? this.socialMedia,
      website: website ?? this.website,
      isAvailableForFreelance:
          isAvailableForFreelance ?? this.isAvailableForFreelance,
      preferredContactMethod:
          preferredContactMethod ?? this.preferredContactMethod,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      workingHours: workingHours ?? this.workingHours,
    );
  }

  @override
  List<String> validate() {
    final errors = <String>[];

    if (email.isEmpty) {
      errors.add('Email is required');
    }
    if (!email.contains('@')) {
      errors.add('Invalid email format');
    }
    if (phone != null && phone!.length < 10) {
      errors.add('Invalid phone number');
    }

    return errors;
  }
}

class SocialMediaLinks {
  final String? linkedin;
  final String? github;
  final String? twitter;
  final String? instagram;
  final String? facebook;

  const SocialMediaLinks({
    this.linkedin,
    this.github,
    this.twitter,
    this.instagram,
    this.facebook,
  });

  Map<String, dynamic> toJson() {
    return {
      'linkedin': linkedin,
      'github': github,
      'twitter': twitter,
      'instagram': instagram,
      'facebook': facebook,
    };
  }

  factory SocialMediaLinks.fromJson(Map<String, dynamic> json) {
    return SocialMediaLinks(
      linkedin: json['linkedin'],
      github: json['github'],
      twitter: json['twitter'],
      instagram: json['instagram'],
      facebook: json['facebook'],
    );
  }
}

class WorkingHours {
  final String timezone;
  final String availableFrom;
  final String availableTo;
  final List<String> workingDays;

  const WorkingHours({
    required this.timezone,
    required this.availableFrom,
    required this.availableTo,
    required this.workingDays,
  });

  Map<String, dynamic> toJson() {
    return {
      'timezone': timezone,
      'availableFrom': availableFrom,
      'availableTo': availableTo,
      'workingDays': workingDays,
    };
  }

  factory WorkingHours.fromJson(Map<String, dynamic> json) {
    return WorkingHours(
      timezone: json['timezone'] ?? 'UTC',
      availableFrom: json['availableFrom'] ?? '09:00',
      availableTo: json['availableTo'] ?? '17:00',
      workingDays: List<String>.from(json['workingDays'] ?? []),
    );
  }
}

enum AvailabilityStatus { available, busy, unavailable }
