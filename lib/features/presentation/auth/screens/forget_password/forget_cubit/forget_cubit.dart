import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());
  static ForgetCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    email.dispose();
    return super.close();
  }

  TextEditingController email = TextEditingController();

}
