import 'package:base_flutter/features/presentation/category_details/widgets/category_details_body.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_app_bar.dart';

class CategoryDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'اسم الباكدج اللي داخلها',
      child: CategoryDetailsBody(),
    );
  }
}
