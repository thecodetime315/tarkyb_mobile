

import '../../../models/register_model.dart';

abstract class AuthBaseRepo{
  Future<bool> login(String email, String password);
  Future<bool> register(RegisterModel registerModel);
  Future<bool> sendEmailForgetPassword(String email);
  Future<bool> updateProfile(String name,String phone,String email);
  Future<bool> logout();
}