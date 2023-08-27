

import 'package:base_flutter/features/presentation/home/resources/home_base_repo.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';
import '../../../models/areas_model.dart';
import '../../../models/cities_model.dart';
import '../../../models/services_model.dart';
import '../../../models/technician_model.dart';

class HomeRepoImpl extends HomeBaseRepo{

  Future<List<ServicesModel>> services() async {
    var data = await DioHelper().get(
      url: AppStringsManager.getServices,
    );
    if (data != null) {
      return List<ServicesModel>.from(
          data["data"].map((e) => ServicesModel.fromJson(e)));
    } else {
      return [];
    }
  }
  Future<List<CitiesModel>> cities() async {
    var data = await DioHelper().get(
      url: AppStringsManager.getCities,
    );
    if (data != null) {
      return List<CitiesModel>.from(
          data["data"].map((e) => CitiesModel.fromJson(e)));
    } else {
      return [];
    }
  }
  Future<List<AreasModel>> areas() async {
    var data = await DioHelper().get(
      url: AppStringsManager.getAreas,
    );
    if (data != null) {
      return List<AreasModel>.from(
          data["data"].map((e) => AreasModel.fromJson(e)));
    } else {
      return [];
    }
  }
  Future<List<TechnicianModel>> techMostRated() async {
    var data = await DioHelper().get(
      url: AppStringsManager.techMostRated,
    );
    if (data != null) {
      return List<TechnicianModel>.from(
          data["data"].map((e) => TechnicianModel.fromJson(e)));
    } else {
      return [];
    }
  }
}