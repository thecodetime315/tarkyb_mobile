import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/helpers/ui_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/custom_widgets/visitor_screen.dart';
import 'package:base_flutter/features/presentation/technician_details/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:base_flutter/features/presentation/technician_details/cubits/tech_details_cubit.dart';
import 'package:base_flutter/features/presentation/technician_details/widgets/technician_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/snack_helper.dart';
import '../../custom_widgets/custom_gradient_button.dart';
import '../auth/blocs/auth_cubit/auth_cubit.dart';

class TechnicianDetails extends StatelessWidget {
  final int id;
  final int isVip;

  const TechnicianDetails({Key? key, required this.id, required this.isVip})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>().state.authorized;

    return Scaffold(

    body: BlocBuilder<TechDetailsCubit, TechDetailsState>(
        builder: (context, state) {
          if (state.techStates == RequestState.loaded)
            return TechnicianDetailsBody();
          if (state.techStates == RequestState.loading)
            return Center(
              child: AppLoaderHelper.showSimpleLoading(),
            );
          return SizedBox();
        },
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => AddToCartCubit(),
        child: BlocBuilder<AddToCartCubit, AddToCartState>(
          builder: (context, state) {
            if (state.addToCartState == RequestState.init ||
                state.addToCartState == RequestState.loaded)
              return CustomGradientButton(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                borderRadius: BorderRadius.circular(4),
                onTap: () {
                  if(cubit){
                    if (context.read<TechDetailsCubit>().servicesId!.isNotEmpty) {
                      context.read<AddToCartCubit>().addToCart(
                          context,
                          context.read<TechDetailsCubit>().servicesId ?? [],
                          context.read<TechDetailsCubit>().pricesOfServices ?? [],
                          context.read<TechDetailsCubit>().technicianId ?? 0,
                          isVip);
                    }
                    else {
                      context
                          .read<AddToCartCubit>()
                          .state
                          .copyWith(addToCartState: RequestState.error);
                      SnackBarHelper.showBasicSnack(msg: "اختر من الخدمات أولا");
                  }
                  }else{
                    UIHelper.showDialog(context: context, child: VisitorScreen(),height: context.height *0.55);
                  }
                },
                title: "اطلب الخدمة",
              );
            if (state.addToCartState == RequestState.loading)
              return Center(
                child: AppLoaderHelper.showSimpleLoading(),
              );
            return SizedBox();
          },
        ),
      ),
    );
  }
}
