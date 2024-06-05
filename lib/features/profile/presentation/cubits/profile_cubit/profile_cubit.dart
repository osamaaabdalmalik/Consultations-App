import 'package:bloc/bloc.dart';
import 'package:consultations_app/core/enums/general_states.dart';
import 'package:consultations_app/core/helpers/get_state_from_failure.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:consultations_app/features/main/domain/usecases/get_home_data_use_case.dart';
import 'package:consultations_app/features/main/domain/usecases/search_use_case.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());

  /// Use Cases
  final GetHomeDataUseCase getHomeDataUseCase = InjectionContainer.getIt();
  final SearchUseCase searchUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Data
  HomeData? homeData;
  List<Expert> resultSearchExperts = [];

  Future<void> getHomeData() async {
    InjectionContainer.getIt<Logger>().i("Start `getHomeData` in |MainCubit|");
    _update(const ProfileState.loading());
    generalState = GeneralStates.loading;
    var result = await getHomeDataUseCase();
    result.fold(
      (l) {
        generalState = getStateFromFailure(l);
        _update(ProfileState.error(l.message));
      },
      (homeData) {
        _update(const ProfileState.loaded());
        generalState = GeneralStates.success;
        this.homeData = homeData;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getHomeData` in |MainCubit| General State:$generalState",
    );
  }

  void _update(ProfileState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
