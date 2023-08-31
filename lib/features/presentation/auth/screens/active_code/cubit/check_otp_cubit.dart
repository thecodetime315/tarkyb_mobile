import 'package:base_flutter/core/injection/get_injection.dart' as di;
import 'package:base_flutter/core/utils/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/helpers/snack_helper.dart';
import '../../../resouces/auth_base_repo.dart';

part 'check_otp_state.dart';

class CheckOtpCubit extends Cubit<CheckOtpState> {
  CheckOtpCubit() : super(CheckOtpState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController code = TextEditingController();
  @override
  Future<void> close() {
    code.dispose();
    return super.close();
  }


  checkOtp(String phone,String fromWhere) async{
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(checkOtpState: RequestState.loading));
      var result = await di
          .getIt<AuthBaseRepo>()
          .checkOtp(phone, code.text, fromWhere);
      if (result) {
        emit(state.copyWith(checkOtpState: RequestState.loaded));
      } else {
        print("messsssage");
        emit(state.copyWith(checkOtpState: RequestState.init));
        SnackBarHelper.showBasicSnack(msg: "حدث خطأ ما");
      }
    }

  }

  resendCode(String phone) async{
   await di.getIt<AuthBaseRepo>().resendOtp(phone);
  }
}
