

import 'package:flutter/material.dart';

import '../../../custom_widgets/technical_person_card.dart';

class FilterBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        return TechnicalPersonCard();
      },
      itemCount: 25,
    );
  }
}
