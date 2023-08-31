part of 'check_otp_cubit.dart';

 class CheckOtpState extends Equatable {
   final RequestState checkOtpState;
  const CheckOtpState({this.checkOtpState = RequestState.init});
   CheckOtpState copyWith({ RequestState? checkOtpState}) {
     return CheckOtpState(checkOtpState: checkOtpState ?? this.checkOtpState);
   }

   List<Object> get props => [checkOtpState];


}


