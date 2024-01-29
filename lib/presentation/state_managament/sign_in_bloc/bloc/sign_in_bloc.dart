import 'package:bloc/bloc.dart';
import 'package:dart_interview/data/entities/user_param.dart';
import 'package:dart_interview/domain/module/user_sign_in.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserSignIn userSignIn;
  SignInBloc(this.userSignIn) : super(SignInState(SignInStatus.initial)) {
    on<OnSignIn>(_onSignIn);
  }

  void _onSignIn(OnSignIn event, Emitter<SignInState> emit) {
    final isRegistered = userSignIn.checkUserAccount();
    if (!isRegistered) {
      emit(SignInState(SignInStatus.newUserError));
    } else {
      final result = userSignIn.call(event.params);
      if (result) {
        emit(SignInState(SignInStatus.success));
      } else {
        emit(SignInState(SignInStatus.error));
      }
    }
  }
}
