import 'package:base_flutter/core/injection/get_injection.dart' as di;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/snack_helper.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../resouces/auth_base_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    email.dispose();
    passwordController.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(loginState: RequestState.loading));
      var result = await di
          .getIt<AuthBaseRepo>()
          .login(email.text, passwordController.text);
      if (result) {
        emit(state.copyWith(loginState: RequestState.loaded));
        SnackBarHelper.showBasicSnack(msg: "تم تسجيل الدخول بنجاح");

      } else {
        emit(state.copyWith(loginState: RequestState.init));
        SnackBarHelper.showBasicSnack(msg: "حدث خطأ ما");
      }
    }
  }
}
