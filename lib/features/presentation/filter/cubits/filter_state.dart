part of 'filter_cubit.dart';

class FilterState extends Equatable {
  final RequestState filterState;
  final List<TechnicianModel> technicianList;
  const FilterState({this.filterState = RequestState.init, this.technicianList =const []});

  FilterState copyWith({RequestState? filterState,List<TechnicianModel>? technicianList, }){
    return FilterState(filterState: filterState ?? this.filterState,
      technicianList: technicianList ?? this.technicianList,);
  }
  @override
  List<Object?> get props => [filterState,technicianList];
}


