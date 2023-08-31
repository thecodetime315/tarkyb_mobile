part of 'reset_password_cubit.dart';

class ResetPasswordState extends Equatable {
  final RequestState resetState;
  const ResetPasswordState({this.resetState = RequestState.init});

  ResetPasswordState copyWith({
    RequestState ? resetState,
}){
    return ResetPasswordState(resetState: resetState?? this.resetState);
  }
  List<Object> get props => [resetState];
}
