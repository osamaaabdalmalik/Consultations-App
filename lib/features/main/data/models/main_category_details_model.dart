import 'package:consultations_app/features/main/data/models/expert_model.dart';
import 'package:consultations_app/features/main/data/models/sub_category_model.dart';
import 'package:consultations_app/features/main/domain/entities/main_category_details_data_entity.dart';

class MainCategoryDetailsModel extends MainCategoryDetails {
  const MainCategoryDetailsModel({
    required super.subCategories,
    required super.expert,
  });

  factory MainCategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryDetailsModel(
      subCategories: json['sub_categories']
          .map<SubCategoryModel>(
            (item) => SubCategoryModel.fromJson(item),
          )
          .toList(),
      expert: json['experts']
          .map<ExpertModel>(
            (item) => ExpertModel.fromJson(item),
          )
          .toList(),
    );
  }
}
