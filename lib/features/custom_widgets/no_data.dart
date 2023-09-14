



import 'package:flutter/material.dart';

import '../../core/base_widgets/my_text.dart';

class NoData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyText(
        title: "لا يوجد بيانات",
      ),
    );
  }
}
