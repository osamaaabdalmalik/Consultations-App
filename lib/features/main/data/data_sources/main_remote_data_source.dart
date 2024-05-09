import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/services/api_service.dart';
import 'package:consultations_app/features/main/data/models/expert_details_model.dart';
import 'package:consultations_app/features/main/data/models/expert_model.dart';
import 'package:consultations_app/features/main/data/models/home_data_model.dart';
import 'package:consultations_app/features/main/data/models/main_category_details_model.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:logger/logger.dart';

abstract class MainRemoteDataSource {
  Future<List<ExpertModel>> search({
    required String query,
  });

  Future<HomeDataModel> getHome();

  Future<MainCategoryDetailsModel> getMainCategoryDetails({
    required int categoryId,
  });

  Future<List<ExpertModel>> getExperts({
    required String expertsType,
    required int subCategoryId,
  });

  Future<ExpertDetailsModel> getExpertDetails({
    required int expertId,
  });
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiService apiService;

  MainRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<ExpertModel>> search({
    required String query,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getExperts` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.search,
        parameters: {
          'query': query,
        },
      );
      final expertModels = mapData['data']
          .map<ExpertModel>(
            (item) => ExpertModel.fromJson(item),
          )
          .toList();

      InjectionContainer.getIt<Logger>().w("End `getExperts` in |MainRemoteDataSourceImpl|");
      return Future.value(expertModels);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getExperts` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<HomeDataModel> getHome() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getHome` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getHome,
      );
      final homeDataModel = HomeDataModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `getHome` in |MainRemoteDataSourceImpl|");
      return Future.value(homeDataModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getHome` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<MainCategoryDetailsModel> getMainCategoryDetails({
    required int categoryId,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getMainCategoryDetails` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getMainCategoryDetails,
        parameters: {
          'category_id': categoryId.toString(),
        },
      );
      final mainCategoryDetailsModel = MainCategoryDetailsModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `getMainCategoryDetails` in |MainRemoteDataSourceImpl|");
      return Future.value(mainCategoryDetailsModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getMainCategoryDetails` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<List<ExpertModel>> getExperts({
    required String expertsType,
    required int subCategoryId,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getExperts` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getExperts,
        parameters: {
          'experts_type': expertsType,
          'sub_category_id': subCategoryId.toString(),
        },
      );
      final expertModels = mapData['experts']
          .map<ExpertModel>(
            (item) => ExpertModel.fromJson(item),
          )
          .toList();

      InjectionContainer.getIt<Logger>().w("End `getExperts` in |MainRemoteDataSourceImpl|");
      return Future.value(expertModels);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getExperts` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<ExpertDetailsModel> getExpertDetails({
    required int expertId,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getExpertDetails` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getMainCategoryDetails,
        parameters: {
          'expert_id': expertId.toString(),
        },
      );
      final expertDetailsModels = ExpertDetailsModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `getExpertDetails` in |MainRemoteDataSourceImpl|");
      return Future.value(expertDetailsModels);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getExpertDetails` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
