import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/tech_details_cubit.dart';
import '../widgets/technician_service_item.dart';

class ServicesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TechDetailsCubit>().state.technicianDetailsModel;

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      itemCount: cubit?.services?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return TechnicianServiceItem(
          services: cubit?.services![index],
        );
      },
    );
  }
}
