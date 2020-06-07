part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class InitialSignInState extends SignInState {}

class SignInLoading extends SignInState {}

class SignInLoaded extends SignInState {
  FirebaseUser user;

  SignInLoaded({
    @required this.user,
  });
}

class SignInLoadError extends SignInState {}
