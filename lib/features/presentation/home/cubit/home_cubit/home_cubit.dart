import 'package:base_flutter/features/presentation/home/resources/home_base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;
import 'package:flutter/material.dart';
import '../../../../../core/helpers/adaptive_picker.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../models/areas_model.dart';
import '../../../../models/cities_model.dart';
import '../../../../models/services_model.dart';
import '../../../../models/technician_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController dateController = TextEditingController();

  dateFun(BuildContext context) {
    AdaptivePicker.datePicker(
      context: context,
      title: "التاريخ",
      onConfirm: (time) {
        dateController.text = time.toString().substring(0,10);
        // cubit.dateController.text = time.toString().substring(0, 10);
      },
    );
  }
  getAllHomeData(){
    emit(state.copyWith(mostRatedState: RequestState.loading,technicianList: []));
    getServices();
    getCities();
    getAreas();
    getTopTechnician();
    emit(state.copyWith(mostRatedState: RequestState.loaded));
  }
  getServices() async{
    // emit(state.copyWith(servicesState: RequestState.loading));
    var result = await di
        .getIt<HomeBaseRepo>().services();
    if(result.isNotEmpty){
      emit(state.copyWith(servicesState: RequestState.loaded,servicesList: result));
    }else{
      emit(state.copyWith(servicesState: RequestState.init));
    }
  }

  getCities() async{
    emit(state.copyWith(citiesState: RequestState.loading,citiesList: []));
    var result = await di
        .getIt<HomeBaseRepo>().cities();
    if(result.isNotEmpty){
      emit(state.copyWith(citiesState: RequestState.loaded,citiesList: result));
    }else{
      emit(state.copyWith(citiesState : RequestState.init,citiesList: []));
    }
  }
  getAreas() async{
    emit(state.copyWith(areasState: RequestState.loading,areasList: []));
    var result = await di
        .getIt<HomeBaseRepo>().areas();
    if(result.isNotEmpty){
      emit(state.copyWith(areasState: RequestState.loaded,areasList: result));
    }else{
      emit(state.copyWith(areasState: RequestState.init,areasList: []));
    }
  }
  getTopTechnician() async{
    emit(state.copyWith(mostRatedState: RequestState.loading,technicianList: []));
    var result = await di
        .getIt<HomeBaseRepo>().techMostRated();
    if(result.isNotEmpty){
      emit(state.copyWith(mostRatedState: RequestState.loaded,technicianList: result));
    }else{
      emit(state.copyWith(mostRatedState: RequestState.init,technicianList: []));
    }
  }
}
