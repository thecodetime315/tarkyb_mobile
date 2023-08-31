import '../../../models/filter_model.dart';
import '../../../models/technician_model.dart';

abstract class FilterBaseRepo {
  Future<List<TechnicianModel>> filter(FilterModel filterModel);
}
