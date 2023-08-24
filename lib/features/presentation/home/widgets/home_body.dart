

import 'package:flutter/material.dart';

import 'home_app_bar.dart';
import 'home_filter.dart';
import 'home_recommend.dart';
import 'home_serivces.dart';
import 'home_slider.dart';

class HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(),
        HomeSlider(),
        Expanded(child:
        ListView(
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
          children: [
            HomeFilter(),
            HomeServices(),
            HomeRecommend()
          ],
        ),)
      ],
    );
  }
}
