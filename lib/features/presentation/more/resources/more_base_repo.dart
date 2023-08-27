


import '../../../models/contact_us_model.dart';
import '../../../models/settings_model.dart';

abstract class MoreBaseRepo{
  Future<List<SettingsModel>> settings();
  Future<bool> contactUs(ContactUsModel model);
}