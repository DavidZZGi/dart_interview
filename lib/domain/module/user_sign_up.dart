import 'package:dart_interview/core/use_case.dart';
import 'package:dart_interview/data/entities/user_param.dart';
import 'package:dart_interview/domain/repositories/user_repository.dart';

class UserSignUp implements UseCase<void, Params> {
  UserRepository userRepository;
  UserSignUp({required this.userRepository});

  @override
  void call(Params params) =>
      userRepository.signUp(params.email, params.password);
}
