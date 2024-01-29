part of 'sign_in_bloc.dart';

enum SignInStatus { initial, loading, success, error, newUserError }

final class SignInState {
  final SignInStatus signInStatus;
  SignInState(this.signInStatus);
}
