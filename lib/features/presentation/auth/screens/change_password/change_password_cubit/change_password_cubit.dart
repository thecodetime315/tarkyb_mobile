import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/resouces/auth_base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/enums.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  changePassword() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(changePasswordState: RequestState.loaded));
      var data = await di.getIt<AuthBaseRepo>().changePassword(
          oldPassword.text, newPassword.text, confirmNewPassword.text);
      if (data) {
        emit(state.copyWith(changePasswordState: RequestState.loaded));
        NavigationService.back();
      } else {
        emit(state.copyWith(changePasswordState: RequestState.init));
      }
    }
  }
}
