import 'package:base_flutter/features/presentation/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/features/presentation/cart/widgets/cart_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../custom_widgets/visitor_screen.dart';

class Cart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>().state.authorized;
    return cubit == true? CartBody() : VisitorScreen();
  }
}
