import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:todoapp/utils/global.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  @override
  SignInState get initialState => InitialSignInState();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignIn && await auth.currentUser() == null) {
      yield SignInLoading();
      try {
        final GoogleSignInAccount googleUser = await googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        FirebaseUser user = (await auth.signInWithCredential(credential)).user;
        print("signed in " + user.displayName);
        Firestore.instance.collection("TodoApp").document(user.uid).setData({
          "name": user.displayName,
          "email": user.email,
        }).then((value) => print('user Registered'));
        if (user != null) {
          yield SignInLoaded(user: user);
        } else
          yield SignInLoadError();
      } catch (error) {
        print('error');
        print(error.toString());
        yield SignInLoadError();
      }
    } else if (await auth.currentUser() != null) {
      yield SignInLoaded(user: await auth.currentUser());
    }
  }
}
