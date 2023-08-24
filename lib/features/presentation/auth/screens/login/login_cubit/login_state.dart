part of 'login_cubit.dart';

class LoginState extends Equatable {
  final RequestState loginState;
  const LoginState({this.loginState = RequestState.init});
  LoginState copyWith({
    RequestState? loginState,
  }) {
    return LoginState(
      loginState: loginState ?? this.loginState,
    );
  }

  @override
  List<Object?> get props => [loginState];
}
