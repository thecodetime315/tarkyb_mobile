import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils_imports.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _checkingData();
    super.initState();
  }

  _checkingData() async {
    Future.delayed(
        Duration(
          milliseconds: 500,
        ), () {
      Utils.manipulateSplashData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      backgroundColor: ColorManager.primary,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              AssetsManager.highPattern,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Align(
            alignment: Alignment.center,
            child: Image(
              image: AssetImage(AssetsManager.logo),
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
