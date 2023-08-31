import 'package:base_flutter/core/injection/get_injection.dart';
import 'package:base_flutter/features/presentation/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/features/presentation/auth/blocs/user_cubit/user_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'core/api_service/DioImports.dart';
import 'core/helpers/preferences_helper.dart';
import 'core/localization/lang_cubit/lang_cubit.dart';
import 'MyApp.dart';
import 'core/resource/app_strings_manager.dart';
import 'features/presentation/filter/cubits/filter_cubit.dart';
import 'features/presentation/main_navigation_bar/cubits/main_navigation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    Preferences.load();
    init();
    DioHelper.init(base: AppStringsManager.baseUrl);

    await Firebase.initializeApp();
  }
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => LangCubit(),
      ),
      BlocProvider(
        create: (context) => BottomNavCubit(),
      ),
      BlocProvider(
        create: (context) => UserCubit(),
      ),
      BlocProvider(
        create: (context) => AuthCubit(),
      ),
      BlocProvider(
        create: (context) => FilterCubit(),
      ),
    ],
    child: Phoenix(child: MyApp()),
  ));
}
