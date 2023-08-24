part of 'profile_cubit.dart';

 class ProfileState extends Equatable {
  final RequestState profileState;
  const ProfileState({this.profileState = RequestState.init});
  ProfileState copyWith({
    RequestState? profileState,
  }) {
    return ProfileState(
      profileState: profileState ?? this.profileState,
    );
  }

  @override
  List<Object?> get props => [profileState];
}
