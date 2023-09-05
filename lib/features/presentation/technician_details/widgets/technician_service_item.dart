import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/technician_details_model.dart';
import '../cubits/tech_details_cubit.dart';

class TechnicianServiceItem extends StatelessWidget {
  final Services? services;

  const TechnicianServiceItem({Key? key, this.services}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TechDetailsCubit>();
    final GenericCubit<bool> checkBoxCubit = GenericCubit(false);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorManager.grey2),
        ),
        child: Row(
          children: [
            BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
              bloc: checkBoxCubit,
              builder: (context, state) {
                return Checkbox(
                  activeColor: ColorManager.primary,
                    value: state.data,
                    onChanged: (val) {
                      checkBoxCubit.onUpdateData(val!);
                      if(val == true){
                        cubit.servicesId?.add(services!.id!);
                        cubit.pricesOfServices?.add(num.parse(services?.price ?? ''));
                        log("service ID is : ${services?.id}");
                      }else{
                        cubit.servicesId?.remove(services!.id!);

                        log("service ID is deleted");
                      }
                    });
              },
            ),
            MyText(
              title: services?.name ?? '',
              size: 12,
              fontWeight: FontWeight.w400,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: MyText(
                title: "${services?.price} ر.س ",
                size: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
