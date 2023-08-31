

import '../../../models/technician_details_model.dart';

abstract class TechBaseRepo{
  Future<TechnicianDetailsModel?> techDetails(int id,int vip);
}