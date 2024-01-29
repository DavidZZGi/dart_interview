part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, loading, success, error }

final class SignUpState {
  final SignUpStatus signUpStatus;
  SignUpState(this.signUpStatus);
}
