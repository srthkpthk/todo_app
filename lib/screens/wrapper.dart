import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/data/bloc/sign_in/sign_in_bloc.dart';
import 'package:todoapp/screens/todo_home_screen.dart';
import 'package:todoapp/screens/widgets/error_widget.dart';
import 'package:todoapp/screens/widgets/loading_widget.dart';

class Wrapper extends StatelessWidget {
  final _bloc = SignInBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TODO',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        child: BlocBuilder(
          bloc: _bloc,
          // ignore: missing_return
          builder: (_, SignInState state) {
            if (state is InitialSignInState) {
              _bloc.add(SignIn());
              return LoadingWidget();
            }
            if (state is SignInLoading) {
              return LoadingWidget();
            }
            if (state is SignInLoadError) {
              return Column(
                children: [
                  LoadErrorWidget(),
                  RaisedButton(
                    onPressed: () => _bloc.add(SignIn()),
                    child: Text(
                      'Retry?',
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ],
              );
            }
            if (state is SignInLoaded) {
              return TodoHomeScreen(state.user);
            }
          },
          // ignore: missing_return
        ),
      ),
    );
  }
}
