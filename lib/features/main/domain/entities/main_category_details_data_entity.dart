import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/entities/sub_category_entity.dart';

class MainCategoryDetails {
  final List<SubCategory> subCategories;
  final List<Expert> expert;

  const MainCategoryDetails({
    required this.subCategories,
    required this.expert,
  });
}
