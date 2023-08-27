

import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/all_recommend_technicians/widgets/all_recommend_technicians_body.dart';
import 'package:flutter/material.dart';

import '../../models/technician_model.dart';

class AllRecommendTechnicians extends StatelessWidget {
  final List<TechnicianModel> technicianList;

  const AllRecommendTechnicians({Key? key, required this.technicianList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: "ترشيحات لك", child: AllRecommendTechniciansBody(technicianList: technicianList,));
  }
}
