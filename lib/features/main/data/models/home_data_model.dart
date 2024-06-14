import 'package:consultations_app/features/expert/data/models/expert_model.dart';
import 'package:consultations_app/features/main/data/models/main_category_model.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';

class HomeDataModel extends HomeData {
  const HomeDataModel({
    required super.mainCategories,
    required super.highestRecommendedExperts,
    required super.highestRatedExperts,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      mainCategories: json['categories']
          .map<MainCategoryModel>(
            (item) => MainCategoryModel.fromJson(item),
          )
          .toList(),
      highestRecommendedExperts: json['highestRecommendedExperts']
          .map<ExpertModel>(
            (item) => ExpertModel.fromJson(item),
          )
          .toList(),
      highestRatedExperts: json['highestRatedExperts']
          .map<ExpertModel>(
            (item) => ExpertModel.fromJson(item),
          )
          .toList(),
    );
  }
}
