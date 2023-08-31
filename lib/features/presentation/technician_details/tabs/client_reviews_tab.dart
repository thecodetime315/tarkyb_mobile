


import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/tech_details_cubit.dart';
import '../widgets/client_review_item.dart';

class ClientReviewsTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TechDetailsCubit>().state.technicianDetailsModel;

    return cubit?.reviews?.length != 0 ? ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        itemCount: cubit?.reviews?.length ?? 0,
        itemBuilder: (_,index){
          return ClientReviewItem(review: cubit?.reviews![index],);
        }): Center(child: MyText(title: "لا يوجد تقييمات",),);
  }
}
