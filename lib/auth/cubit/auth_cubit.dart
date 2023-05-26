import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:what_to_do_app/domain/repositories/auth_repository.dart';
import 'package:what_to_do_app/enums.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState());

  final AuthRepository authRepository;

//sign in
  Future<void> signIn({required String email, required String password}) async {
    try {
      await authRepository.signIn(email: email, password: password);
      emit(
        AuthState(status: Status.success),
      );
    } catch (error) {
      emit(
        AuthState(
            user: null, errorMessage: error.toString(), status: Status.error),
      );
    }
  }

//sign out
  Future<void> signOut() async {
    await authRepository.signOut();
    emit(AuthState(status: Status.success));
  }

  //register
  Future<void> register(
      {required String email, required String password}) async {
    try {
      authRepository.register(email: email, password: password);
      emit(AuthState(status: Status.success));
    } catch (error) {
      emit(AuthState(
          user: null, errorMessage: error.toString(), status: Status.error));
    }
  }

  //auth state changes
  StreamSubscription? streamSubscription;

  Future<void> start() async {
    emit(
      AuthState(
        user: null,
        isCreatingAccount: false,
        status: Status.initial,
        errorMessage: '',
      ),
    );

    streamSubscription = authRepository.authState().listen(
      (user) {
        emit(
          AuthState(user: user),
        );
      },
    )..onError(
        (error) {
          emit(
            AuthState(errorMessage: error.toString(), status: Status.error),
          );
        },
      );
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
