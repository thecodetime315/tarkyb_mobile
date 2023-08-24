
import 'package:base_flutter/features/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resource/navigation_service.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../blocs/user_cubit/user_cubit.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;

import '../../../resouces/auth_base_repo.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    name.dispose();
    phone.dispose();
    return super.close();
  }
  var user = navigatorKey.currentContext!.read<UserCubit>().state.model;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  getProfileData(){
    name.text = user.name ?? '';
    phone.text = user.phone ?? '';
    email.text = user.email ?? '';
  }

  updateProfile(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(profileState: RequestState.loading));
      var result = await di
          .getIt<AuthBaseRepo>()
          .updateProfile(name.text, phone.text,email.text);
      if (result) {
        emit(state.copyWith(profileState: RequestState.loaded));
        UserModel model = UserModel(
          name: name.text,
          email: email.text,
          phone: phone.text
        );
        context.read<UserCubit>().onUpdateUserData(model);
      } else {
        emit(state.copyWith(profileState: RequestState.init));
      }
    }
  }

}
