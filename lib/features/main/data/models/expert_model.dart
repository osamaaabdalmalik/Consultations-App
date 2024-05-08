import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';

class ExpertModel extends Expert {
  const ExpertModel({
    required super.id,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.address,
    required super.about,
    required super.rating,
    required super.ratingNumber,
    required super.consultanciesNumber,
  });

  factory ExpertModel.fromJson(Map<String, dynamic> json) {
    return ExpertModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      phone: json['phone'],
      about: json['about'],
      address: json['address'],
      rating: json['rating'],
      ratingNumber: json['rating_number'],
      consultanciesNumber: json['consultancies_number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'address': address,
      'rating': rating,
      'rating_number': ratingNumber,
      'consultancies_number': consultanciesNumber,
    };
  }
}
