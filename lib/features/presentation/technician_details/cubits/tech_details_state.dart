part of 'tech_details_cubit.dart';

class TechDetailsState extends Equatable {
  final TechnicianDetailsModel? technicianDetailsModel;
  final RequestState techStates;
  const TechDetailsState(
      {this.technicianDetailsModel, this.techStates = RequestState.loading});

  TechDetailsState copyWith(
      {TechnicianDetailsModel? technicianDetailsModel,
      RequestState? techStates}) {
    return TechDetailsState(
        technicianDetailsModel:
            technicianDetailsModel ?? this.technicianDetailsModel,
        techStates: techStates ?? this.techStates);
  }

  @override
  List<Object?> get props => [technicianDetailsModel, techStates];
}
