import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;
import '../../../../../../core/helpers/snack_helper.dart';
import '../../../../../../core/resource/navigation_service.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../resouces/auth_base_repo.dart';
import '../../login/login_view.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordState());
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(resetState: RequestState.loading));
      var result = await di.getIt<AuthBaseRepo>().resetPassword(
          passwordController.text, confirmPasswordController.text);
      if (result) {
        emit(state.copyWith(resetState: RequestState.loaded));
        NavigationService.removeUntil(LoginView());
        SnackBarHelper.showBasicSnack(msg: "تم تسجيل الدخول بنجاح");
      } else {
        emit(state.copyWith(resetState: RequestState.init));
        SnackBarHelper.showBasicSnack(msg: "حدث خطأ ما");
      }
    }
  }
}
