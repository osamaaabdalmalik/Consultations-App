import 'package:consultations_app/features/expert/domain/entities/experience_entity.dart';
import 'package:consultations_app/features/main/domain/entities/sub_category_entity.dart';

class ExpertDetails {
  final List<Experience> experiences;
  final List<SubCategory> subCategories;

  const ExpertDetails({
    required this.experiences,
    required this.subCategories,
  });
}
