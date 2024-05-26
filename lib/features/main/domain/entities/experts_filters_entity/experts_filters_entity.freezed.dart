// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experts_filters_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpertsFilters {
  ExpertsTypes get selectedExpertsType => throw _privateConstructorUsedError;

  MainCategory? get selectedMainCategory => throw _privateConstructorUsedError;

  SubCategory? get selectedSubCategory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ExpertsFiltersCopyWith<ExpertsFilters> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpertsFiltersCopyWith<$Res> {
  factory $ExpertsFiltersCopyWith(ExpertsFilters value, $Res Function(ExpertsFilters) then) =
      _$ExpertsFiltersCopyWithImpl<$Res, ExpertsFilters>;

  @useResult
  $Res call({ExpertsTypes selectedExpertsType, MainCategory? selectedMainCategory, SubCategory? selectedSubCategory});
}

/// @nodoc
class _$ExpertsFiltersCopyWithImpl<$Res, $Val extends ExpertsFilters> implements $ExpertsFiltersCopyWith<$Res> {
  _$ExpertsFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedExpertsType = null,
    Object? selectedMainCategory = freezed,
    Object? selectedSubCategory = freezed,
  }) {
    return _then(_value.copyWith(
      selectedExpertsType: null == selectedExpertsType
          ? _value.selectedExpertsType
          : selectedExpertsType // ignore: cast_nullable_to_non_nullable
              as ExpertsTypes,
      selectedMainCategory: freezed == selectedMainCategory
          ? _value.selectedMainCategory
          : selectedMainCategory // ignore: cast_nullable_to_non_nullable
              as MainCategory?,
      selectedSubCategory: freezed == selectedSubCategory
          ? _value.selectedSubCategory
          : selectedSubCategory // ignore: cast_nullable_to_non_nullable
              as SubCategory?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpertsFiltersImplCopyWith<$Res> implements $ExpertsFiltersCopyWith<$Res> {
  factory _$$ExpertsFiltersImplCopyWith(_$ExpertsFiltersImpl value, $Res Function(_$ExpertsFiltersImpl) then) =
      __$$ExpertsFiltersImplCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({ExpertsTypes selectedExpertsType, MainCategory? selectedMainCategory, SubCategory? selectedSubCategory});
}

/// @nodoc
class __$$ExpertsFiltersImplCopyWithImpl<$Res> extends _$ExpertsFiltersCopyWithImpl<$Res, _$ExpertsFiltersImpl>
    implements _$$ExpertsFiltersImplCopyWith<$Res> {
  __$$ExpertsFiltersImplCopyWithImpl(_$ExpertsFiltersImpl _value, $Res Function(_$ExpertsFiltersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedExpertsType = null,
    Object? selectedMainCategory = freezed,
    Object? selectedSubCategory = freezed,
  }) {
    return _then(_$ExpertsFiltersImpl(
      selectedExpertsType: null == selectedExpertsType
          ? _value.selectedExpertsType
          : selectedExpertsType // ignore: cast_nullable_to_non_nullable
              as ExpertsTypes,
      selectedMainCategory: freezed == selectedMainCategory
          ? _value.selectedMainCategory
          : selectedMainCategory // ignore: cast_nullable_to_non_nullable
              as MainCategory?,
      selectedSubCategory: freezed == selectedSubCategory
          ? _value.selectedSubCategory
          : selectedSubCategory // ignore: cast_nullable_to_non_nullable
              as SubCategory?,
    ));
  }
}

/// @nodoc

class _$ExpertsFiltersImpl implements _ExpertsFilters {
  _$ExpertsFiltersImpl({required this.selectedExpertsType, this.selectedMainCategory, this.selectedSubCategory});

  @override
  final ExpertsTypes selectedExpertsType;
  @override
  final MainCategory? selectedMainCategory;
  @override
  final SubCategory? selectedSubCategory;

  @override
  String toString() {
    return 'ExpertsFilters(selectedExpertsType: $selectedExpertsType, selectedMainCategory: $selectedMainCategory, selectedSubCategory: $selectedSubCategory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpertsFiltersImpl &&
            (identical(other.selectedExpertsType, selectedExpertsType) ||
                other.selectedExpertsType == selectedExpertsType) &&
            (identical(other.selectedMainCategory, selectedMainCategory) ||
                other.selectedMainCategory == selectedMainCategory) &&
            (identical(other.selectedSubCategory, selectedSubCategory) ||
                other.selectedSubCategory == selectedSubCategory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedExpertsType, selectedMainCategory, selectedSubCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpertsFiltersImplCopyWith<_$ExpertsFiltersImpl> get copyWith =>
      __$$ExpertsFiltersImplCopyWithImpl<_$ExpertsFiltersImpl>(this, _$identity);
}

abstract class _ExpertsFilters implements ExpertsFilters {
  factory _ExpertsFilters(
      {required final ExpertsTypes selectedExpertsType,
      final MainCategory? selectedMainCategory,
      final SubCategory? selectedSubCategory}) = _$ExpertsFiltersImpl;

  @override
  ExpertsTypes get selectedExpertsType;

  @override
  MainCategory? get selectedMainCategory;

  @override
  SubCategory? get selectedSubCategory;

  @override
  @JsonKey(ignore: true)
  _$$ExpertsFiltersImplCopyWith<_$ExpertsFiltersImpl> get copyWith => throw _privateConstructorUsedError;
}
