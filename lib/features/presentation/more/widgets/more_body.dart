import 'dart:developer';

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/models/settings_model.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:base_flutter/features/presentation/auth/screens/profile/profile_cubit/profile_cubit.dart';
import 'package:base_flutter/features/presentation/more/resources/more_base_repo.dart';
import 'package:base_flutter/features/presentation/more/screens/contact_us/cubit/contact_us_cubit.dart';
import 'package:base_flutter/features/presentation/more/widgets/more_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/blocs/auth_cubit/auth_cubit.dart';
import '../../auth/resouces/auth_base_repo.dart';
import '../../auth/screens/profile/profile_view.dart';
import '../../main_navigation_bar/cubits/main_navigation_cubit.dart';
import '../screens/about/about_view.dart';
import '../screens/contact_us/contact_us_view.dart';
import '../screens/policy/policy_view.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;

class MoreBody extends StatefulWidget {
  const MoreBody();

  @override
  State<MoreBody> createState() => _MoreBodyState();
}

class _MoreBodyState extends State<MoreBody> {
  final GenericCubit<List<SettingsModel>> settingsCubit = GenericCubit([]);
  getSettings() async {
    var result = await di.getIt<MoreBaseRepo>().settings();
    if (result != []) {
      settingsCubit.onUpdateData(result);
    }
  }

  @override
  void initState() {
    getSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AuthCubit>().state.authorized;
    return BlocBuilder<GenericCubit<List<SettingsModel>>,
        GenericState<List<SettingsModel>>>(
      bloc: settingsCubit,
      builder: (BuildContext context, state) {
        return ListView(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          children: [
            cubit? Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: MyText(
                title: "معلومات حسابى",
                size: 12,
                color: ColorManager.grey2,
                fontWeight: FontWeight.w600,
              ),
            ): const SizedBox(),
            cubit? MoreItem(
              titleItem: 'الملف الشخصي',
              imageItem: AssetsManager.profile,
              onTap: () {
                NavigationService.navigateTo(BlocProvider(
                  create: (context) => ProfileCubit()..getProfileData(),
                  child: ProfileView(),
                ));
              },
            ) : const SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: MyText(
                title: "معلومات عامة",
                size: 12,
                color: ColorManager.grey2,
                fontWeight: FontWeight.w600,
              ),
            ),
            MoreItem(
              titleItem: 'من نحن',
              imageItem: AssetsManager.about,
              onTap: () {
                NavigationService.navigateTo(
                    AboutView(state.data[2].value ?? ''));
              },
            ),
            cubit?   MoreItem(
              titleItem: 'تواصل معنا',
              imageItem: AssetsManager.contactus,
              onTap: () {
                NavigationService.navigateTo(BlocProvider(
                  create: (context) => ContactUsCubit(),
                  child: ContactUsView(
                    model: state.data,
                  ),
                ));
              },
            ):SizedBox(),
            MoreItem(
              titleItem: 'الشروط والاحكام',
              imageItem: AssetsManager.terms,
              onTap: () {
                NavigationService.navigateTo(PolicyView(
                  value: state.data[3].value ?? '',
                ));
              },
            ),
            SizedBox(
              height: 10,
            ),
            cubit?   MoreItem(
              titleItem: 'تسجيل خروج',
              imageItem: AssetsManager.logout,
              onTap: () async {
                await di.getIt<AuthBaseRepo>().logout();
                context.read<BottomNavCubit>().updateIndex(0);
              },
              isLogout: true,
            ): MoreItem(
              titleItem: 'تسجيل دخول',
              imageItem: AssetsManager.logout,
              onTap: () async {
                NavigationService.removeUntil(LoginView());
              },
              isLogout: true,
            ),
          ],
        );
      },
    );
  }
}
