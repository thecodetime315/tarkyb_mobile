part of 'contact_us_cubit.dart';

 class ContactUsState extends Equatable {
   final RequestState contactUsState;
  const ContactUsState({this.contactUsState = RequestState.init});
   ContactUsState copyWith({
     RequestState? contactUsState,
   }) {
     return ContactUsState(
       contactUsState: contactUsState ?? this.contactUsState,
     );
   }
  @override
  List<Object?> get props => [contactUsState];
}


