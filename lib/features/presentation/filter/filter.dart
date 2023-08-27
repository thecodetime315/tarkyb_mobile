

import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/filter/widgets/filter_body.dart';
import 'package:flutter/material.dart';

class Filter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: "نتيجة البحث", child: FilterBody());
  }
}
