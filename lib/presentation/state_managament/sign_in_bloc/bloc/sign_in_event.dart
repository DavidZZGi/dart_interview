part of 'sign_in_bloc.dart';

@immutable
sealed class SignInEvent {}

class OnSignIn extends SignInEvent {
  final Params params;

  OnSignIn({required this.params});
}
