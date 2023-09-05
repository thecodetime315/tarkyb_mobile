import 'package:base_flutter/features/presentation/category_details/cubits/get_techs_by_services_cubit.dart';
import 'package:base_flutter/features/presentation/category_details/widgets/category_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_widgets/custom_app_bar.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  final int id;

  const CategoryDetailsScreen({Key? key, required this.title, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      child: BlocProvider(
        create: (context) => GetTechsByServicesCubit()..getTechs(id),
        child: CategoryDetailsBody(),
      ),
    );
  }
}
