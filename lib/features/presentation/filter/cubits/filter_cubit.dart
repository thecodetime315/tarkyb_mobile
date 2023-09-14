
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/filter_model.dart';
import 'package:base_flutter/features/presentation/filter/filter.dart';
import 'package:base_flutter/features/presentation/filter/resources/filter_base_repo.dart';
import 'package:base_flutter/features/presentation/filter/resources/filter_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/technician_model.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterState());
  int? serviceId;
  int? cityId;
  int? areaId;
  bool? vip;
  FilterBaseRepo filterRepo = FilterRepoImpl();

  filter({String date = ''}) async{
    emit(state.copyWith(filterState: RequestState.loading));
    FilterModel filterModel = FilterModel(serviceId: serviceId,cityId: cityId,areaId: areaId,date: date, vip: vip == true ? 1 : 0);
    var result = await filterRepo.filter(filterModel);
    if(result != []){
      emit(state.copyWith(filterState: RequestState.loaded,technicianList: result));
      NavigationService.navigateTo(Filter(isVip: vip == true ? 1 : 0));

    }
    else{
      emit(state.copyWith(filterState: RequestState.init,technicianList: []));
      NavigationService.navigateTo(Filter(isVip: vip == true ? 1 : 0));
    }
  }
}
