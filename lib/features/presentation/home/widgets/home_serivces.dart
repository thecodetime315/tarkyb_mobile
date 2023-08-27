import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/home/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_services_item.dart';

class HomeServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var homeCubit = context.read<HomeCubit>().state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: "خدماتنا",
          fontWeight: FontWeight.w400,
          color: ColorManager.primary,
          alien: TextAlign.start,
          size: 16,
        ),
        SizedBox(
          height: 12,
        ),
        if (homeCubit.servicesState == RequestState.loaded)
          homeCubit.servicesList.isNotEmpty
              ? Wrap(children: List.generate(homeCubit.servicesList.length, (index) => HomeServicesItem(model: homeCubit.servicesList[index],)))
              : Center(
                  child: MyText(
                    title: "لا يوجد بيانات",
                  ),
                ),
        if (homeCubit.servicesState == RequestState.loading)
          Center(child: AppLoaderHelper.showSimpleLoading(),)
      ],
    );
  }
}
