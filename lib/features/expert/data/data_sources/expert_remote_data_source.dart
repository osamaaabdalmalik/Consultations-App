import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/services/api_service.dart';
import 'package:consultations_app/features/expert/data/models/expert_model.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:logger/logger.dart';

abstract class ExpertRemoteDataSource {
  Future<List<ExpertModel>> getExperts({
    required int page,
    int limit = 10,
    String? expertsType,
    int? subCategoryId,
    int? mainCategoryId,
  });
}

class ExpertRemoteDataSourceImpl extends ExpertRemoteDataSource {
  final ApiService apiService;

  ExpertRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ExpertModel>> getExperts({
    required int page,
    int limit = 10,
    String? expertsType,
    int? subCategoryId,
    int? mainCategoryId,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getExperts` in |ExpertRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getExperts,
        parameters: {
          'page': page.toString(),
          'limit': limit.toString(),
          'experts_type': expertsType.toString(),
          'sub_category_id': subCategoryId.toString(),
          'main_category_id': mainCategoryId.toString(),
        },
      );
      final expertModels = mapData['data']['data']
          .map<ExpertModel>(
            (item) => ExpertModel.fromJson(item),
          )
          .toList();

      InjectionContainer.getIt<Logger>().w("End `getExperts` in |ExpertRemoteDataSourceImpl|");
      return Future.value(expertModels);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getExperts` in |ExpertRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
