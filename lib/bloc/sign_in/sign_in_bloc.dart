import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/data/repository/repository.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  AppRepository _repository = AppRepository();

  @override
  SignInState get initialState => InitialSignInState();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SigningIn || _repository.user == null) {
      _repository.signIn();
      yield SigningInProgress();
      if (_repository.user != null) {
        yield SignInSuccessFul();
      } else
        yield SignInFailed();
    }
  }
}
