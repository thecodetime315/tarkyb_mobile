import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/custom_widgets/technical_person_card.dart';
import 'package:base_flutter/features/presentation/category_details/cubits/get_techs_by_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTechsByServicesCubit, GetTechsByServicesState>(
      builder: (context, state) {
        if (state.techsState == RequestState.loading)
          return Center(
            child: AppLoaderHelper.showSimpleLoading(),
          );
        if (state.techsState == RequestState.loaded)
          return state.technicianList.length != 0
              ? ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemBuilder: (context, index) {
                    return TechnicalPersonCard(
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
