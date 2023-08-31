import 'dart:developer';

import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/auth/screens/active_code/active_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;

import '../../../resouces/auth_base_repo.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetState());
  static ForgetCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    phone.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();

  forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(state.withCopy(forgetState: RequestState.loading));
      var data =
          await di.getIt<AuthBaseRepo>().sendPhoneForgetPassword(phone.text);
      if (data) {
        emit(state.withCopy(forgetState: RequestState.loaded));

        NavigationService.navigateTo(ActiveView(
          phone: phone.text,
          fromWhere: "forget",
        ));
      } else {
        log("message2");
        emit(state.withCopy(forgetState: RequestState.init));
      }
    }
  }
}
