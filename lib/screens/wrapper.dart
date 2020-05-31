import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/sign_in/sign_in_bloc.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  SignInBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = SignInBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
      bloc: _bloc,
      // ignore: missing_return
      builder: (_, SignInState state) {
        if (state is SigningInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SignInFailed) {
          return Center(
            child: Container(
              child: Column(
                children: <Widget>[
                  Text(
                    'SignIn Failed...',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      _bloc.add(SigningIn());
                    },
                    child: Text(
                      'Retry',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (state is SignInSuccessFul) {
          return Center(
            child: Text(
              'Done',
            ),
          );
        }
      },
    ));
  }
}
