import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'core/helpers/preferences_helper.dart';
import 'core/localization/lang_cubit/lang_cubit.dart';
import 'MyApp.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    Preferences.load();
    await Firebase.initializeApp();
  }
  runApp(
    BlocProvider(
      create: (BuildContext context) => LangCubit(),
      child:  Phoenix(child: MyApp()),
    )
  );
}
