import 'package:consultations_app/features/main/data/models/experience_model.dart';
import 'package:consultations_app/features/main/data/models/sub_category_model.dart';
import 'package:consultations_app/features/main/domain/entities/expert_details_data_entity.dart';

class ExpertDetailsModel extends ExpertDetails {
  const ExpertDetailsModel({
    required super.experiences,
    required super.subCategories,
  });

  factory ExpertDetailsModel.fromJson(Map<String, dynamic> json) {
    return ExpertDetailsModel(
      experiences: json['experiences']
          .map<ExperienceModel>(
            (item) => ExperienceModel.fromJson(item),
          )
          .toList(),
      subCategories: json['sub_categories']
          .map<SubCategoryModel>(
            (item) => SubCategoryModel.fromJson(item),
          )
          .toList(),
    );
  }
}
