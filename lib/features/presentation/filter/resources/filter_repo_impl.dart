import 'package:base_flutter/features/models/technician_model.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';
import '../../../models/filter_model.dart';
import 'filter_base_repo.dart';

class FilterRepoImpl extends FilterBaseRepo {
  Future<List<TechnicianModel>> filter(FilterModel filterModel) async {
    var data = await DioHelper()
        .post(url: AppStringsManager.filterSearch, body: filterModel.toJson());
    if (data['data'] != null) {
      return List<TechnicianModel>.from(
          data["data"].map((e) => TechnicianModel.fromJson(e)));
    } else {
      return [];
    }
  }
}
