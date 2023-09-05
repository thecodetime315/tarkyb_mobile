import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/technician_details_model.dart';
import 'package:base_flutter/features/presentation/technician_details/resources/tech_base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../resources/tech_repo_impl.dart';

part 'tech_details_state.dart';

class TechDetailsCubit extends Cubit<TechDetailsState> {
  TechDetailsCubit() : super(TechDetailsState());

  List<int>? servicesId = [];
  List<num>? pricesOfServices = [];
  int? technicianId = 0;
  TechBaseRepo techRepo = TechRepoImpl();
  getTechDetails(int id,int vip)async {
    emit(state.copyWith(techStates: RequestState.loading));
    var result = await techRepo.techDetails(id,vip);
    if(result != null){
      emit(state.copyWith(techStates: RequestState.loaded,technicianDetailsModel: result));
      technicianId = result.id ?? 0;
    }
  }
}
