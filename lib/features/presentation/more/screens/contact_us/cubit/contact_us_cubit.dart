import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/contact_us_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;

import '../../../resources/more_base_repo.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsState());
  @override
  Future<void> close() {
    email.dispose();
    name.dispose();
    message.dispose();
    phone.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController message = TextEditingController();

  contactUs() async {
    if (formKey.currentState!.validate()) {
      ContactUsModel model = ContactUsModel(
        email: email.text,
        name: name.text,
        phone: phone.text,
        message: message.text,
        type: "message"
      );
      emit(state.copyWith(contactUsState: RequestState.loading));

      var result = await di.getIt<MoreBaseRepo>().contactUs(model);
    if(result){
      emit(state.copyWith(contactUsState: RequestState.loaded));
      email.clear();
      name.clear();
      phone.clear();
      message.clear();
    }
    else{
      emit(state.copyWith(contactUsState: RequestState.init));

    }
    }
  }
}
