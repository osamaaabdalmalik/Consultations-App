import 'package:consultations_app/features/main/domain/entities/main_category_entity.dart';

class MainCategoryModel extends MainCategory {
  const MainCategoryModel({
    required super.id,
    required super.name,
    required super.description,
    required super.image,
  });

  factory MainCategoryModel.fromJson(Map<String, dynamic> json) {
    return MainCategoryModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
