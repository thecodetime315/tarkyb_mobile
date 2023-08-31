part of 'get_techs_by_services_cubit.dart';

 class GetTechsByServicesState extends Equatable {
   final RequestState techsState;
   final List<TechnicianModel> technicianList;

   const GetTechsByServicesState({this.techsState = RequestState.loading, this.technicianList = const []});
   GetTechsByServicesState copyWith({
     RequestState? techsState,
     List<TechnicianModel>? technicianList,
   }) {
     return GetTechsByServicesState(
       techsState: techsState ?? this.techsState,
       technicianList: technicianList ?? this.technicianList,
     );
   }
  @override
  List<Object?> get props => [techsState,technicianList];
}


