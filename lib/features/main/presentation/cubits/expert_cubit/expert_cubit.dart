import 'package:bloc/bloc.dart';
import 'package:consultations_app/core/enums/general_states.dart';
import 'package:consultations_app/core/helpers/get_state_from_failure.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/usecases/get_experts_use_case.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'expert_cubit.freezed.dart';
part 'expert_cubit_state.dart';

class ExpertCubit extends Cubit<ExpertState> {
  ExpertCubit() : super(const ExpertState.initial());

  /// Use Cases
  final GetExpertsUseCase getExpertsUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Data
  List<Expert>? experts;

  /// variables

  Future<void> getExperts({
    required String expertsType,
    required int mainCategoryId,
    required int subCategoryId,
  }) async {
    InjectionContainer.getIt<Logger>().i("Start `getExperts` in |MainCubit|");
    _update(const ExpertState.loading());
    generalState = GeneralStates.loading;
    var result = await getExpertsUseCase(
      expertsType: expertsType,
      subCategoryId: subCategoryId,
      mainCategoryId: mainCategoryId,
    );
    result.fold(
      (l) {
        generalState = getStateFromFailure(l);
        _update(ExpertState.error(l.message));
      },
      (experts) {
        _update(ExpertState.loaded(experts));
        generalState = GeneralStates.success;
        this.experts = experts;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getExperts` in |MainCubit| General State:$generalState",
    );
  }

  void _update(ExpertState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
