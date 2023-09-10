part of 'change_password_cubit.dart';

class ChangePasswordState extends Equatable {
  final RequestState changePasswordState;
  const ChangePasswordState({this.changePasswordState = RequestState.init});
  ChangePasswordState copyWith({
    RequestState? changePasswordState,
  }) {
    return ChangePasswordState(
        changePasswordState: changePasswordState ?? this.changePasswordState);
  }

  List<Object> get props => [changePasswordState];
}
