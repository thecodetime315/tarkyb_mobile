import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/features/models/areas_model.dart';
import 'package:base_flutter/features/models/cart_model.dart';
import 'package:base_flutter/features/models/cities_model.dart';
import 'package:base_flutter/features/models/create_order_model.dart';
import 'package:base_flutter/features/models/working_time_model.dart';
import 'package:base_flutter/features/presentation/cart/resources/cart_base_repo.dart';
import 'package:base_flutter/features/presentation/cart/resources/cart_repo_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../core/base_widgets/my_text.dart';
import '../../../core/helpers/adaptive_picker.dart';
import '../../../core/helpers/ui_helper.dart';
import '../../../core/location_address/LocationAddressImports.dart';
import '../../../core/location_address/location_cubit/location_cubit.dart';
import '../../../core/location_address/location_model/location_model.dart';
import '../../../core/resource/assets_manager.dart';
import '../../../core/resource/color_manager.dart';
import '../../../core/resource/navigation_service.dart';
import '../../../core/utils/utils_imports.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;

import '../../custom_widgets/custom_gradient_button.dart';
import '../home/resources/home_base_repo.dart';
import '../main_navigation_bar/cubits/main_navigation_cubit.dart';
import '../main_navigation_bar/main_navigation_bar.dart';

class CartLogic {
  final LocationCubit locationCubit = LocationCubit();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  void onLocationClick(BuildContext context) async {
    var _loc = await Utils.getCurrentLocation();
    locationCubit.onLocationUpdated(LocationModel(
      lat: _loc?.latitude ?? 24.77426,
      lng: _loc?.longitude ?? 46.738586,
      address: "",
    ));
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (_) => BlocProvider.value(
          value: locationCubit,
          child: LocationAddress(),
        ),
      ),
    );
  }

  CartBaseRepo cartRepo = CartRepoImpl();
  // cubits
  final GenericCubit<CartModel?> cartCubit = GenericCubit(null);
  final GenericCubit<List<CitiesModel>> citiesCubit = GenericCubit([]);
  final GenericCubit<List<AreasModel>> areasCubit = GenericCubit([]);
  final GenericCubit<List<WorkingTimeModel>> workingTimeCubit =
      GenericCubit([]);
  final GenericCubit<num> totalPrice = GenericCubit(0);
  final GenericCubit<int> selectPaymentCubit = GenericCubit(0);
  final GenericCubit<bool> loadingButton = GenericCubit(false);
  final GenericCubit<int> selectedCityCubit = GenericCubit(0);
  final GenericCubit<int> selectedAreaCubit = GenericCubit(0);


  WorkingTimeModel? periodId;

  // Cart Services
  getCart() async {
    var data = await cartRepo.getCart();
    if (data != null) {
      cartCubit.onUpdateData(data);
      totalPrice.onUpdateData(data.total ?? 0);
    } else {
      cartCubit.onUpdateData(null);
    }
  }

  updateCart(
      {required int cartId,
      required int serviceId,
      required int quantity,
      required int index}) async {
    var data = await cartRepo.updateServiceCount(cartId,
        serviceId: serviceId, quantity: quantity);
    if (data) {
      getCart();
    }
  }

  deleteService({required int serviceId, required int cartId}) async {
    var result = await cartRepo.deleteService(cartId, serviceId: serviceId);
    if (result) {
      getCart();
    }
  }

  deleteAllCart() async {
    var result = await cartRepo.deleteAllCart();
    if (result) {
      cartCubit.onUpdateData(null);
    }
  }
  // Get Services

  getCities() async {
    var result = await di.getIt<HomeBaseRepo>().cities();
    if (result.isNotEmpty) {
      citiesCubit.onUpdateData(result);
    }
  }

  getAreas() async {
    var result = await di.getIt<HomeBaseRepo>().areas();
    if (result.isNotEmpty) {
      areasCubit.onUpdateData(result);
    }
  }

  getWorkingTime(String date, int technicianId) async {
    var result = await cartRepo.getWorkingTime(date, technicianId);
    if (result.isNotEmpty) {
      workingTimeCubit.onUpdateData(result);
    }
  }

  dateFun(BuildContext context, int technicianId) {
    AdaptivePicker.datePicker(
      context: context,
      title: "التاريخ",
      onConfirm: (time) {
        dateController.text = time.toString().substring(0, 10);
        getWorkingTime(time.toString().substring(0, 10), technicianId);
      },
    );
  }

  // Create Order

  createOrder(int technicianId, BuildContext context) async {
    loadingButton.onUpdateData(true);
    // todo : handle Usecase
    CreateOrderModel model = CreateOrderModel(
      cityId: selectedCityCubit.state.data,
      areaId: selectedAreaCubit.state.data,
      technicianId: technicianId,
      periodId: periodId?.id ?? 0,
      datetime: dateController.text,
      address: locationCubit.state.model!.address,
      lat: locationCubit.state.model!.lat,
      long: locationCubit.state.model!.lat,
      paymentMethod: selectPaymentCubit.state.data == 1 ? "cash" : "online",
      vip: 0,
    );
    var data = await cartRepo.createOrder(model);
    if (data) {
      UIHelper.showDialog(
          context: context,
          child: Column(
            children: [
              LottieBuilder.asset(
                AssetsManager.successJson,
                height: 140,
                fit: BoxFit.fill,
              ),
              MyText(
                title: "تم اضافة طلبك بنجاح",
                color: ColorManager.grey2,
                size: 12,
              ),
              CustomGradientButton(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                title: "اذهب للرئيسية",
                onTap: () {
                  context.read<BottomNavCubit>().updateIndex(0);
                  NavigationService.removeUntil(MainNavigationBar());
                  loadingButton.onUpdateData(false);

                },
              )
            ],
          ),
          height: 250);

    }
  }
}
