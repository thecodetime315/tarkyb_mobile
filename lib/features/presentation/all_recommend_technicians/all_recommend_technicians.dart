

import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/all_recommend_technicians/widgets/all_recommend_technicians_body.dart';
import 'package:flutter/material.dart';

class AllRecommendTechnicians extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: "ترشيحات لك", child: AllRecommendTechniciansBody());
  }
}
