
import 'package:base_flutter/features/presentation/auth/resouces/auth_base_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/presentation/auth/resouces/auth_repo_impl.dart';
import '../resource/app_strings_manager.dart';


final  getIt = GetIt.instance;

Future<void> init() async{
  // Features

  // Core
  getIt.registerLazySingleton(() => AppStringsManager());
  // Repos
  getIt.registerLazySingleton<AuthBaseRepo>(() => AuthRepoImpl());

  // External
}
