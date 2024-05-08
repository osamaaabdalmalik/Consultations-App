import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/entities/main_category_entity.dart';

class HomeData {
  final List<MainCategory> mainCategories;
  final List<Expert> highestRecommendedExperts;
  final List<Expert> highestRatedExperts;

  const HomeData({
    required this.mainCategories,
    required this.highestRecommendedExperts,
    required this.highestRatedExperts,
  });
}
