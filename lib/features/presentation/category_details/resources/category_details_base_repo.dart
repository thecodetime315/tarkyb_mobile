

import '../../../models/technician_model.dart';

abstract class CategoryDetailsBaseRepo{
  Future<List<TechnicianModel>> getTechsByServices(int id);
}