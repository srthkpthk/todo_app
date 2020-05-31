part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {}

class InitialSignInState extends SignInState {}

class SignInSuccessFul extends SignInState {}

class SignInFailed extends SignInState {}

class SigningInProgress extends SignInState {}