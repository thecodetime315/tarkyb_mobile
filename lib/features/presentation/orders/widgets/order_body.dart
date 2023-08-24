
import 'package:flutter/material.dart';

import 'order_item.dart';

class OrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 5),
      itemCount:6,
      itemBuilder: (context, index) {
        return OrderItem();
      },
    ) ;
  }
}
