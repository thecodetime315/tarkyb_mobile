part of 'forget_cubit.dart';

 class ForgetState extends Equatable {
   final RequestState forgetState;
  const ForgetState({this.forgetState = RequestState.init});
   ForgetState withCopy({RequestState? forgetState}){
     return ForgetState(forgetState: forgetState ?? this.forgetState);
   }
  @override
  List<Object?> get props => [forgetState];
}

