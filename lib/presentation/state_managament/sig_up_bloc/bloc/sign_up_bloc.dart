import 'package:bloc/bloc.dart';
import 'package:dart_interview/data/entities/user_param.dart';
import 'package:dart_interview/domain/module/user_sign_up.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserSignUp userSignUp;
  SignUpBloc(this.userSignUp) : super(SignUpState(SignUpStatus.initial)) {
    on<OnSignUp>(_onSignUp);
  }

  void _onSignUp(OnSignUp event, Emitter<SignUpState> emit) {
    userSignUp.call(event.params);
    emit(SignUpState(SignUpStatus.success));
  }
}
