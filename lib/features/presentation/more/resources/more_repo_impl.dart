

import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/features/models/contact_us_model.dart';
import 'package:base_flutter/features/models/settings_model.dart';
import 'package:base_flutter/features/presentation/more/resources/more_base_repo.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';

class MoreRepoImpl extends MoreBaseRepo{

  Future<List<SettingsModel>> settings() async {
    var data = await DioHelper().get(
      url: AppStringsManager.settings,
    );
    if (data != null) {
      return List<SettingsModel>.from(
          data["data"].map((e) => SettingsModel.fromJson(e)));
    } else {
      return [];
    }
  }
  Future<bool> contactUs(ContactUsModel model) async {

    var data = await DioHelper().post(url: AppStringsManager.contactUs, body: model.toJson());
    if(data != null){
      SnackBarHelper.showBasicSnack(msg: "تم ارسالك رسالتك لنا بنجاح");
      return true;
    }else{
      return false;
    }
  }
}