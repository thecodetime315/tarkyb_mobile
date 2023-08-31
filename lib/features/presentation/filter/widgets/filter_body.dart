import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/filter/cubits/filter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom_widgets/technical_person_card.dart';

class FilterBody extends StatelessWidget {
  final int isVip;

  const FilterBody({Key? key, required this.isVip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state.filterState == RequestState.loading)
          return Center(
            child: AppLoaderHelper.showSimpleLoading(),
          );
        if (state.filterState == RequestState.loaded)
          return state.technicianList.length != 0
              ? ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return TechnicalPersonCard(
                      isVip: isVip,
                      model: state.technicianList[index],
                    );
                  },
                  itemCount: state.technicianList.length,
                )
              : Center(
                  child: MyText(
                    title: "لا يوجد بيانات",
                  ),
                );

        return SizedBox();
      },
    );
  }
}
