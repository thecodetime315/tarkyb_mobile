
import 'package:base_flutter/features/presentation/auth/resouces/auth_base_repo.dart';
import 'package:base_flutter/features/presentation/home/resources/home_base_repo.dart';
import 'package:base_flutter/features/presentation/home/resources/home_repo_impl.dart';
import 'package:base_flutter/features/presentation/more/resources/more_base_repo.dart';
import 'package:base_flutter/features/presentation/more/resources/more_repo_impl.dart';
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
  getIt.registerLazySingleton<HomeBaseRepo>(() => HomeRepoImpl());
  getIt.registerLazySingleton<MoreBaseRepo>(() => MoreRepoImpl());

  // External
}
