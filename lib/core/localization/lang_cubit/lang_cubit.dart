import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../helpers/language_cache_helper.dart';

part 'lang_state.dart';

class LangCubit extends Cubit<ChangeLangState> {
  LangCubit() : super(ChangeLangState(locale: const Locale('ar')));

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();

    emit(ChangeLangState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(ChangeLangState(locale: Locale(languageCode)));
  }
}
