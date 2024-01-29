part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class OnSignUp extends SignUpEvent {
  final Params params;
  OnSignUp({required this.params});
}
