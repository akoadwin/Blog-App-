import 'package:blog_app/features/auth/domain/entities/user.dart';
import 'package:blog_app/features/auth/domain/usecases/user_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignup _userSignup;

  AuthBloc({
    required UserSignup userSignUp,
  })  : _userSignup = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final res = await _userSignup(UserSignUpParams(
        email: event.email,
        name: event.name,
        password: event.password,
      ));

      res.fold(
        (l) => emit(AuthFailure(l.message)),
        (user) => emit(AuthSuccess(user)),
      );
    });
  }
}
