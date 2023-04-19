import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInEvent>((event, emit) async {
      emit(SignInLoadingState());

      try {
        AuthResponse res =
            await Supabase.instance.client.auth.signInWithPassword(
          email: event.email,
          password: event.password,
        );

        if (res.user != null && res.user!.userMetadata!['isAdmin']) {
          emit(SignInSuccessState());
        } else {
          emit(SignInFailureState());
          Supabase.instance.client.auth.signOut();
        }
      } catch (e, s) {
        log("$e\n$s");
        emit(SignInFailureState());
      }
    });
  }
}
