

import 'package:base_flutter/features/custom_widgets/visitor_screen.dart';
import 'package:base_flutter/features/presentation/orders/widgets/orders_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/localization/app_localizations.dart';
import '../../custom_widgets/app_custom_appbar.dart';
import '../auth/blocs/auth_cubit/auth_cubit.dart';

class OrdersView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>().state.authorized;
    return cubit ?  DefaultTabController(
      length: 2,
      child: AppCustomAppbar(
        titlePage: tr(context,"orders"),
        body: OrdersBody(),
      ),
    ) : VisitorScreen();
  }
}
