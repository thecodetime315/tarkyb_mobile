part of 'cart_cubit.dart';

class CartState extends Equatable {
  final CartModel? cartModel;
  final List<CitiesModel> cityList;
  final List<AreasModel> areaList;
  final RequestState cartState;
  final RequestState deleteAllCartState;
  final RequestState deleteService;

  const CartState({
    this.cartModel,
    this.cityList = const [],
    this.areaList = const [],
    this.cartState = RequestState.init,
    this.deleteService = RequestState.init,
    this.deleteAllCartState = RequestState.init
  });
  CartState copyWith(
      {CartModel? cartModel,
      List<CitiesModel>? cityList,
      List<AreasModel>? areaList,
        RequestState? deleteAllCartState,
        RequestState? deleteService,
      RequestState? cartState}) {
    return CartState(
        cartState: cartState ?? this.cartState,
        cartModel: cartModel ?? this.cartModel,
        areaList: areaList ?? this.areaList,
        cityList: cityList ?? this.cityList,
      deleteAllCartState: deleteAllCartState ?? this.deleteAllCartState,
        deleteService: deleteService ?? this.deleteService
    );
  }

  List<Object> get props => [cartState, cityList, areaList,deleteAllCartState,deleteService];
}
