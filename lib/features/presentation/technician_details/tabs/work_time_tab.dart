


import 'package:flutter/material.dart';

import '../widgets/technician_times.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/tech_details_cubit.dart';
class WorkTimeTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TechDetailsCubit>().state.technicianDetailsModel;

    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        itemCount: cubit?.workingPeriods?.length ?? 0,
    itemBuilder: (_,index){
      return TechnicianTimes(workingPeriods: cubit?.workingPeriods![index],);
    });
  }
}
