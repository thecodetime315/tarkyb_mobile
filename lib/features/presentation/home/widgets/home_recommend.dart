import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/home/cubit/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../custom_widgets/no_data.dart';
import '../../../custom_widgets/technical_person_card.dart';
import '../../all_recommend_technicians/all_recommend_technicians.dart';

class HomeRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: "ترشيحات لك",
                color: ColorManager.primary,
                size: 16,
                fontWeight: FontWeight.w400,
              ),
              InkWell(
                  onTap: () {
                    NavigationService.navigateTo(AllRecommendTechnicians(
                      technicianList: cubit.state.technicianList,
                    ));
                  },
                  child: MyText(
                    title: "عرض الكل",
                    color: ColorManager.grey2,
                    size: 13,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  )),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          // if(cubit.state.mostRatedState == RequestState.loaded)
          cubit.state.technicianList.length > 0
              ? Column(
                  children: List.generate(
                      3,
                      (index) => TechnicalPersonCard(
                            model: cubit.state.technicianList[index],
                          )),
                )
              : NoData(),

          // if(cubit.state.mostRatedState == RequestState.loading)
          //   Center(child: AppLoaderHelper.showSimpleLoading(),),
          // if(cubit.state.mostRatedState == RequestState.error)
          //   NoData()
        ],
      ),
    );
  }
}
