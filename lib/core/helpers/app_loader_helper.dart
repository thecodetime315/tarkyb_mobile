import 'dart:io';

import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppLoaderHelper {
  static showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: ColorManager.primary, shape: BoxShape.circle),
            );
          },
        ),
        status: "loading");
  }

  static showLoadingView({Color? color}) {
    return Center(
      child: SpinKitThreeBounce(
        color: color?? ColorManager.primary,
        size: 40.0,
      ),
    );
  }
  static showSimpleLoading({Color? color}) {
   if(Platform.isIOS){
     return CupertinoActivityIndicator(
         radius: 20.0, color: color ?? ColorManager.primary);
   }else{
     return CircularProgressIndicator(
       color: color ?? ColorManager.primary,
     );
   }
  }
}
