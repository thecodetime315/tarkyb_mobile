import 'package:base_flutter/features/presentation/category_details/resources/category_details_base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/utils/enums.dart';
import '../../../models/technician_model.dart';
import '../resources/category_details_repo_impl.dart';

part 'get_techs_by_services_state.dart';

class GetTechsByServicesCubit extends Cubit<GetTechsByServicesState> {
  GetTechsByServicesCubit() : super(GetTechsByServicesState());


  CategoryDetailsBaseRepo repo = CategoryDetailsRepoImpl();

  getTechs(int id) async{
    emit(state.copyWith(techsState: RequestState.loading));
    var result = await repo.getTechsByServices(id);
    if(result.isNotEmpty){
      emit(state.copyWith(techsState: RequestState.loaded,technicianList: result));
    }else{
      emit(state.copyWith(techsState: RequestState.init));
    }
  }
}
