import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/assets_manager.dart';
import '../cubits/tech_details_cubit.dart';
import '../widgets/technician_info.dart';
import '../widgets/technician_texts_item.dart';

class DescTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TechDetailsCubit>().state.technicianDetailsModel;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TechnicianInfo(
              image: AssetsManager.locationPng,
              value: cubit?.city ?? '',
            ),
            TechnicianInfo(
              image: AssetsManager.ageUser,
              value: '${cubit?.age} سنة ',
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        TechnicianTextsItem(
          value: cubit?.about ?? 'لا يوجد وصف للفني',
        ),
      ],
    );
  }
}
