part of 'home_cubit.dart';

class HomeState extends Equatable {
  final RequestState servicesState;
  final RequestState citiesState;
  final RequestState areasState;
  final RequestState mostRatedState;
  final List<CitiesModel> citiesList;
  final List<AreasModel> areasList;
  final List<ServicesModel> servicesList;
  final List<TechnicianModel> technicianList;
  const HomeState(
      {this.servicesState = RequestState.loading,
      this.citiesState = RequestState.loading,
      this.areasState = RequestState.loading,
      this.mostRatedState = RequestState.loading,
      this.citiesList = const [],
      this.areasList = const [],
      this.servicesList = const [],
      this.technicianList = const []});
  HomeState copyWith({
    RequestState? servicesState,
    RequestState? citiesState,
    RequestState? areasState,
    RequestState? mostRatedState,
    List<CitiesModel>? citiesList,
    List<AreasModel>? areasList,
    List<ServicesModel>? servicesList,
    List<TechnicianModel>? technicianList,
  }) {
    return HomeState(
      servicesState: servicesState ?? this.servicesState,
      citiesState: citiesState ?? this.citiesState,
      areasState: areasState ?? this.areasState,
      mostRatedState: mostRatedState ?? this.mostRatedState,
      citiesList: citiesList ?? this.citiesList,
      areasList: areasList ?? this.areasList,
      servicesList: servicesList ?? this.servicesList,
      technicianList: technicianList ?? this.technicianList,
    );
  }

  @override
  List<Object?> get props => [
        servicesState,
        citiesState,
        mostRatedState,
        citiesList,
        areasList,
        servicesList,
        technicianList,
      ];
}
