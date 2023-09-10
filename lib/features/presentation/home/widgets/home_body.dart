import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/features/presentation/home/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import 'home_app_bar.dart';
import 'home_filter.dart';
import 'home_recommend.dart';
import 'home_serivces.dart';
import 'home_slider.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllHomeData(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.mostRatedState == RequestState.loading)
            return Center(
              child: AppLoaderHelper.showSimpleLoading(),
            );
          if (state.mostRatedState == RequestState.loaded)
            return ListView(
              children: [
                HomeAppBar(),
                HomeSlider(),
                HomeFilter(), HomeServices(), HomeRecommend()
              ],
            );
          return SizedBox();
        },
      ),
    );
  }
}
