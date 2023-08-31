


import 'package:base_flutter/features/models/technician_model.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';
import 'category_details_base_repo.dart';

class CategoryDetailsRepoImpl extends CategoryDetailsBaseRepo{
  Future<List<TechnicianModel>> getTechsByServices(int id) async {
    var data = await DioHelper().get(
      url: AppStringsManager.getTechsByServices + "$id",
    );
    if (data != null) {
      return List<TechnicianModel>.from(
          data["data"].map((e) => TechnicianModel.fromJson(e)));
    } else {
      return [];
    }
  }
}