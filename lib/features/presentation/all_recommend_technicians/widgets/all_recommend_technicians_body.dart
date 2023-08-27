import 'package:flutter/material.dart';
import '../../../custom_widgets/technical_person_card.dart';
import '../../../models/technician_model.dart';

class AllRecommendTechniciansBody extends StatelessWidget {
  final List<TechnicianModel> technicianList;

  const AllRecommendTechniciansBody({Key? key, required this.technicianList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemBuilder: (context, index) {
        return TechnicalPersonCard(
          model: technicianList[index],
        );
      },
      itemCount: technicianList.length,
    );
  }
}
