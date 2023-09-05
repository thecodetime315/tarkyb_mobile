import 'dart:developer';

import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/areas_model.dart';
import 'package:base_flutter/features/models/cart_model.dart';
import 'package:base_flutter/features/models/cities_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../home/resources/home_base_repo.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;

import '../resources/cart_base_repo.dart';
import '../resources/cart_repo_impl.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  CartBaseRepo cartRepo = CartRepoImpl();
  getCart() async {
    emit(state.copyWith(cartState: RequestState.loading));
    getCities();
    var result = await cartRepo.getCart();
    log("result = $result");
    if (result != null) {
      log("done ${result.services?.length}");
      emit(state.copyWith(cartState: RequestState.loaded, cartModel: result));
    } else {
      emit(state.copyWith(cartState: RequestState.init, cartModel: null));
      log("mesh done");
    }
  }

  deleteAllCart() async {
    emit(state.copyWith(deleteAllCartState: RequestState.loading));
    var result = await cartRepo.deleteAllCart();
    if (result) {
      getCart();
      emit(state.copyWith(
          deleteAllCartState: RequestState.init, cartModel: null));
    } else {
      emit(state.copyWith(deleteAllCartState: RequestState.init));
    }
  }

  deleteService(int id, int serviceId) async {
    emit(state.copyWith(deleteService: RequestState.loading));
    var result = await cartRepo.deleteService(id, serviceId: serviceId);
    if (result) {
      getCart();
    }
  }



  getCities() async {
    var result = await di.getIt<HomeBaseRepo>().cities();
    if (result.isNotEmpty) {
      emit(state.copyWith(cityList: result));
      getAreas();
    }
  }

  getAreas() async {
    var result = await di.getIt<HomeBaseRepo>().areas();
    if (result.isNotEmpty) {
      emit(state.copyWith(areaList: result));
    }
  }
}
