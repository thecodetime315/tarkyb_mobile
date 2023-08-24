import 'package:base_flutter/features/models/register_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;
import '../../../../../../core/helpers/snack_helper.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../resouces/auth_base_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    email.dispose();
    passwordController.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      RegisterModel model = RegisterModel(
        name: name.text,
        email: email.text,
        phone: phone.text,
        password: passwordController.text,
        confirmPassword:confirmPasswordController.text,
        type: 'user'
      );
      emit(state.copyWith(registerState: RequestState.loading));
      var result = await di
          .getIt<AuthBaseRepo>()
          .register(model);
      if (result) {
        emit(state.copyWith(registerState: RequestState.loaded));
      } else {
        emit(state.copyWith(registerState: RequestState.init));
        SnackBarHelper.showBasicSnack(msg: "حدث خطأ ما");
      }
    }
  }


}
