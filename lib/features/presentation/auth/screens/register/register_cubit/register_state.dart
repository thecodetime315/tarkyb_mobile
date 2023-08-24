part of 'register_cubit.dart';

 class RegisterState extends Equatable {
   final RequestState registerState;

   const RegisterState({this.registerState = RequestState.init});
   RegisterState copyWith({
     RequestState? registerState,
   }) {
     return RegisterState(
       registerState: registerState ?? this.registerState,
     );
   }
  @override
  List<Object?> get props => [registerState];
}


