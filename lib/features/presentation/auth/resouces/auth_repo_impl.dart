

import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/resouces/auth_base_repo.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';
import '../../../../core/utils/utils_imports.dart';
import '../../../models/register_model.dart';
import '../screens/login/login_view.dart';

class AuthRepoImpl extends AuthBaseRepo{

  Future<bool> login(String email, String password) async {
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
      // "access_token": _firebaseMessaging.getToken(),
    };
    var data = await DioHelper().post(url: AppStringsManager.login, body: body);
    if (data["data"]["user"] != null) {
      Utils.manipulateLoginData(data["data"]["user"], data["data"]['token']);
      return true;
    } else {
      return false;
    }
  }
  Future<bool> register(RegisterModel registerModel) async {

    var data = await DioHelper().post(url: AppStringsManager.register, body: registerModel.toJson());
    if (data["data"]["user"] != null) {
      SnackBarHelper.showBasicSnack(msg: "تم تسجيل الحساب الجديد");
      NavigationService.back();
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data["message"]);
      return false;
    }
  }

  Future<bool> sendEmailForgetPassword(String email) async {
    Map<String,dynamic> body = {
      "email" : email
    };
    var data = await DioHelper().post(url: AppStringsManager.forgotPassword, body: body);
    if (data["data"]["user"] != null) {
      SnackBarHelper.showBasicSnack(msg: "تم تسجيل الحساب الجديد");
      NavigationService.back();
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data["message"]);
      return false;
    }
  }

  Future<bool> updateProfile(String name,String phone,String email) async {
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