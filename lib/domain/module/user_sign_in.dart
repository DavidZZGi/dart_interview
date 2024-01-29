import 'package:dart_interview/core/use_case.dart';
import 'package:dart_interview/data/entities/user_param.dart';
import 'package:dart_interview/domain/repositories/user_repository.dart';

class UserSignIn implements UseCase<bool, Params> {
  UserRepository userRepository;
  UserSignIn({required this.userRepository});

  @override
  bool call(Params params) =>
      userRepository.signIn(params.email, params.password);

  bool checkUserAccount() => userRepository.checkUserAccount();
}
