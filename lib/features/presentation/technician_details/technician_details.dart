import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/technician_details/cubits/tech_details_cubit.dart';
import 'package:base_flutter/features/presentation/technician_details/widgets/technician_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_widgets/custom_gradient_button.dart';
import '../add_to_cart/add_to_cart.dart';

class TechnicianDetails extends StatelessWidget {
  final int id;
  final int isVip;

  const TechnicianDetails({Key? key, required this.id, required this.isVip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TechDetailsCubit()..getTechDetails(id,isVip),
      child: Scaffold(
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
        bottomNavigationBar: CustomGradientButton(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          borderRadius: BorderRadius.circular(4),
          onTap: () {
            NavigationService.navigateTo(AddToCart());
          },
          title: "اطلب الخدمة",
        ),
      ),
    );
  }
}
