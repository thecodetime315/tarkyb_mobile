

import '../../../models/areas_model.dart';
import '../../../models/cities_model.dart';
import '../../../models/services_model.dart';
import '../../../models/technician_model.dart';

abstract class HomeBaseRepo{
  Future<List<ServicesModel>> services();
  Future<List<CitiesModel>> cities();
  Future<List<AreasModel>> areas();
  Future<List<TechnicianModel>> techMostRated();
}