import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/add_to_cart_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/base_widgets/my_text.dart';
import '../../../../../core/helpers/ui_helper.dart';
import '../../../../../core/resource/assets_manager.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../../core/resource/navigation_service.dart';
import '../../../../custom_widgets/custom_gradient_button.dart';
import '../../../main_navigation_bar/cubits/main_navigation_cubit.dart';
import '../../../main_navigation_bar/main_navigation_bar.dart';
import '../../resources/tech_base_repo.dart';
import '../../resources/tech_repo_impl.dart';
part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartState());
  TechBaseRepo techRepo = TechRepoImpl();

  addToCart(BuildContext context,  List<int> servicesId,
  List<num>? pricesOfServices,
  int? technicianId,int vip) async {
    emit(state.copyWith(addToCartState: RequestState.loading));
    AddToCartModel addToCartModel = AddToCartModel(
      technicianId: technicianId,
      serviceId: servicesId,
      price: pricesOfServices,
    );
    var result = await techRepo.addToCart(addToCartModel);
    if (result) {
      emit(state.copyWith(
        addToCartState: RequestState.loaded,
      ));
      UIHelper.showDialog(
          context: context,
          child: Column(
            children: [
              LottieBuilder.asset(
                AssetsManager.successJson,
                height: 100,
              ),
              MyText(
                title: "تمت اضافة طلبك الى السلة بنجاح",
                color: ColorManager.grey2,
                size: 14,
              ),
              CustomGradientButton(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                title: "اذهب للسلة",
                onTap: () {
                  context.read<BottomNavCubit>().updateIndex(2);
                  NavigationService.removeUntil(MainNavigationBar());
                },
              )
            ],
          ),
          height: 220);
    }
  }
}
