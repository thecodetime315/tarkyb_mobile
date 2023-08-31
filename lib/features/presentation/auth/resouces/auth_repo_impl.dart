import 'package:base_flutter/core/helpers/preferences_helper.dart';
import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/resouces/auth_base_repo.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/reset_password_view.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';
import '../../../../core/utils/utils_imports.dart';
import '../../../models/register_model.dart';
import '../screens/login/login_view.dart';

class AuthRepoImpl extends AuthBaseRepo {
  Future<bool> login(String phone, String password) async {
    Map<String, dynamic> body = {
      "phone": phone,
      "password": password,
      // "access_token": _firebaseMessaging.getToken(),
    };
    Preferences.setString("phone", phone);
    var data = await DioHelper().post(url: AppStringsManager.login, body: body);
    if (data["data"]["user"] != null) {
      Utils.manipulateLoginData(data["data"]["user"], data["data"]['token']);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(RegisterModel registerModel) async {
    var data = await DioHelper()
        .post(url: AppStringsManager.register, body: registerModel.toJson());
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data["data"][0]);
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data["message"]);
      return false;
    }
  }

  Future<bool> sendPhoneForgetPassword(String phone) async {
    Map<String, dynamic> body = {"phone": phone};
    var data = await DioHelper()
        .post(url: AppStringsManager.forgotPassword, body: body);
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: "تم ارسال كود التفعيل الى هاتفك");
      NavigationService.back();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkOtp(String phone, String otp, String fromWhere) async {
    Map<String, dynamic> body = {"phone": phone, "otp": otp};
    var data =
        await DioHelper().post(url: AppStringsManager.checkOtp, body: body);
    if (data != null) {
      if (fromWhere == 'login' || fromWhere == 'register') {
        Utils.manipulateLoginData(data["data"]["user"], data["data"]['token']);
      }
      switch (fromWhere) {
        case 'login':
        case 'register':

          Utils.manipulateLoginData(
              data["data"]["user"], data["data"]['token']);
          break;
        case 'forget':
          Utils.setToken(data["data"]['token']);
          NavigationService.navigateTo(ResetPasswordView());
      }
      SnackBarHelper.showBasicSnack(msg: "تم ارسال كود التفعيل الى هاتفك");
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: "حدث خطأ ما");
      return false;
    }
  }

  Future<bool> resendOtp(String phone) async {
    Map<String, dynamic> body = {"phone": phone};
    var data = await DioHelper()
        .post(url: AppStringsManager.resendOtp, body: body);
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['data'][0]);
        return true;
    } else {
      return false;
    }
  }
  Future<bool> resetPassword(String password,String confirmPassword) async {
    Map<String, dynamic> body = {"password": password,"password_confirmation" : confirmPassword};
    var data = await DioHelper()
        .post(url: AppStringsManager.resetPassword, body: body);
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data["data"]);
        return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProfile(String name, String phone, String email) async {
    Map<String, dynamic> body = {
      "name": name,
      "phone": phone,
      "email": email,
      // "access_token": _firebaseMessaging.getToken(),
    };
    var data = await DioHelper().post(
      url: AppStringsManager.updateProfile,
      body: body,
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['data']);
      NavigationService.back();
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data['message']);

      return false;
    }
  }

  Future<bool> logout() async {
    var data = await DioHelper().post(
      url: AppStringsManager.logout,
      body: {},
    );
    if (data != null) {
      Utils.clearSavedData();
      SnackBarHelper.showBasicSnack(msg: data['data']);
      NavigationService.removeUntil(LoginView());
      return true;
    } else {
      return false;
    }
  }
}
