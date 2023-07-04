import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/preferences_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/font_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:flutter/material.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../../core/resource/assets_manager.dart';
import '../../../../models/on_boarding_model.dart';

class OnBoardingView extends StatefulWidget {
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final _controller = PageController();
  int sliderPage = 0;
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(
        id: 1, title: 'تركيب وتصليح\nتكييفات', image: AssetsManager.page1),
    OnBoardingModel(id: 2, title: 'صيانة دورية', image: AssetsManager.page2),
    OnBoardingModel(
        id: 3,
        title: 'أقل الأسعار \nمقارنة بالسوق',
        image: AssetsManager.page3),
    OnBoardingModel(
        id: 1, title: 'خدمة متاحة\n طوال اليوم', image: AssetsManager.page4),
  ];
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        sliderPage = _controller.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: PageView.builder(
        itemCount: onBoardingList.length,
        controller: _controller,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Stack(
                children: [
                  Image.asset(AssetsManager.highPattern),
                  Positioned(
                      height: 100,
                      right: 0,
                      left: 2,
                      bottom: 5,
                      child: Image.asset(AssetsManager.logoWithoutCircle))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () async {
                      if (index + 1 == onBoardingList.length) {
                        NavigationService.navigateAndReplacement(LoginView());
                        Preferences.setBool('firstTime', false);
                      } else {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: ColorManager.white,
                    ),
                  ),
                  Image.asset(
                    onBoardingList[index].image,
                    height: 220,
                  ),
                  IconButton(
                    onPressed: () {
                      _controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios,
                        color: ColorManager.white),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Center(
                        child: GradientText(
                          onBoardingList[index].title,
                          style: TextStyle(
                            fontFamily: FontConstants.fontFamily,
                            fontSize: 26.0,
                          ),
                          gradientDirection: GradientDirection.ttb,
                          colors: [
                            ColorManager.white,
                            ColorManager.textOnBoarding
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: onBoardingList.map((url) {
                        int index = onBoardingList.indexOf(url);
                        return Container(
                          width: sliderPage == index ? 20 : 5,
                          height: 7,
                          margin: EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: sliderPage == index
                                ? BorderRadius.circular(20)
                                : BorderRadius.circular(50),
                            color: sliderPage == index
                                ? ColorManager.textOnBoarding
                                : ColorManager.white,
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Preferences.setBool('firstTime', false);
          NavigationService.navigateAndReplacement(LoginView());
        },
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: ColorManager.white,
              ),
              SizedBox(
                width: 5,
              ),
              MyText(
                title: "تخطي",
                color: ColorManager.white,
                size: 18,
                fontWeight: FontWeight.normal,
              )
            ],
          ),
        ),
      ),
    );
  }
}
