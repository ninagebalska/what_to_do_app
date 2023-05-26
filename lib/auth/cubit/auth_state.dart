part of 'auth_cubit.dart';

class AuthState {
  final User? user;
  final bool isCreatingAccount;
  final String errorMessage;
  final Status status;

  AuthState({this.user, this.isCreatingAccount=false, this.errorMessage='', this.status=Status.initial});
}
