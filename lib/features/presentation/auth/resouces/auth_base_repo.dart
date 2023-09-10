

import '../../../models/register_model.dart';

abstract class AuthBaseRepo{
  Future<bool> login(String email, String password);
  Future<bool> register(RegisterModel registerModel);
  Future<bool> sendPhoneForgetPassword(String phone);
  Future<bool> updateProfile(String name,String phone,String email);
  Future<bool> checkOtp(String phone,String otp,String fromWhere);
  Future<bool> changePassword(String oldPassword, String newPassword, String confirmNewPassword);
  Future<bool> resendOtp(String phone);
  Future<bool> resetPassword(String password,String confirmPassword);
  Future<bool> logout();
}