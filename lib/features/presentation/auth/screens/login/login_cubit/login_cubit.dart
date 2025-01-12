import 'package:base_flutter/core/injection/get_injection.dart' as di;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helpers/snack_helper.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../main_navigation_bar/cubits/main_navigation_cubit.dart';
import '../../../resouces/auth_base_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());
  static LoginCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    phone.dispose();
    passwordController.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(loginState: RequestState.loading));
      var result = await di
          .getIt<AuthBaseRepo>()
          .login(phone.text, passwordController.text);
      if (result) {
        emit(state.copyWith(loginState: RequestState.loaded));
        SnackBarHelper.showBasicSnack(msg: "تم تسجيل الدخول بنجاح");
        context.read<BottomNavCubit>().updateIndex(0);

      } else {
        emit(state.copyWith(loginState: RequestState.init));
        SnackBarHelper.showBasicSnack(msg: "حدث خطأ ما");
      }
    }
  }
}
