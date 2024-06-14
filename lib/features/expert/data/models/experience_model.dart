import 'package:consultations_app/features/expert/domain/entities/experience_entity.dart';

class ExperienceModel extends Experience {
  const ExperienceModel({
    required super.id,
    required super.name,
    required super.experienceYears,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      id: json['id'],
      name: json['name'],
      experienceYears: json['experience_years']['experience_years'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'experience_years': experienceYears,
    };
  }
}
