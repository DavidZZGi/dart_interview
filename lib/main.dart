import 'package:dart_interview/domain/module/user_sign_in.dart';
import 'package:dart_interview/domain/module/user_sign_up.dart';
import 'package:dart_interview/domain/repositories/user_repository.dart';
import 'package:dart_interview/presentation/screens/home_page_screen.dart';
import 'package:dart_interview/presentation/screens/screen.dart';
import 'package:dart_interview/presentation/state_managament/sig_up_bloc/bloc/sign_up_bloc.dart';
import 'package:dart_interview/presentation/state_managament/sign_in_bloc/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'app/utils/util_preferences.dart';
import 'presentation/state_managament/global_state_provider/user_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UtilPreferences();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = UtilPreferences();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        BlocProvider(
            create: (context) => SignInBloc(
                UserSignIn(userRepository: UserRepository(prefs: prefs)))),
        BlocProvider(
            create: (context) => SignUpBloc(
                UserSignUp(userRepository: UserRepository(prefs: prefs))))
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpView(),
          '/home': (context) => const HomePage()
        },
      ),
    );
  }
}
