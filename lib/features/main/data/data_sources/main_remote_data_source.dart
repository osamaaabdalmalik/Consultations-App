import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/services/api_service.dart';
import 'package:consultations_app/features/main/data/models/pair_model.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:logger/logger.dart';

abstract class MainRemoteDataSource {
  Future<List<PairModel>> getCategoriesAsPair({required int repositoryId});
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiServiceImpl apiService;

  MainRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<PairModel>> getCategoriesAsPair({required int repositoryId}) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getCategoriesAsPair` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getCategoriesAsPair,
        parameters: {
          'repository_id': repositoryId.toString(),
        },
      );
      final List<PairModel> expenses = mapData['data']
          .map<PairModel>(
            (item) => PairModel.fromJson(item),
          )
          .toList();

      InjectionContainer.getIt<Logger>().w("End `getCategoriesAsPair` in |MainRemoteDataSourceImpl|");
      return Future.value(expenses);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getCategoriesAsPair` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
