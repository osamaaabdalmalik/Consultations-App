import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/features/main/domain/entities/main_category_entity.dart';
import 'package:consultations_app/features/main/domain/entities/sub_category_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'experts_filters_entity.freezed.dart';

@freezed
class ExpertsFilters with _$ExpertsFilters {
  factory ExpertsFilters({
    required ExpertsTypes selectedExpertsType,
    MainCategory? selectedMainCategory,
    SubCategory? selectedSubCategory,
  }) = _ExpertsFilters;
}
