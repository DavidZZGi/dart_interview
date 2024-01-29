import 'package:dart_interview/data/entities/user_param.dart';
import 'package:dart_interview/presentation/state_managament/sig_up_bloc/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => SignUpViewState();
}

class SignUpViewState extends State<SignUpView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _repeatPasswordController =
      TextEditingController();

  bool _showPassword = true;

  bool _repeatShowPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Sign Up'),
      ),
      backgroundColor: Colors.white,
      body: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.signUpStatus == SignUpStatus.success) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Account created sucessfully'),
              ),
            );
            Future.delayed(const Duration(seconds: 1),
                () => Navigator.pushReplacementNamed(context, '/'));
          }
        },
        child: SingleChildScrollView(
          child: Column(children: [
            const FlutterFormIcon(),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    controller: _passwordController,
                    obscureText: _showPassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _repeatPasswordController,
                    obscureText: _repeatShowPassword,
                    decoration: InputDecoration(
                      labelText: 'Repeat Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _repeatShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _repeatShowPassword = !_repeatShowPassword;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  FilledButton(
                    child: const Text('Sign up'),
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      final repeatPassword = _repeatPasswordController.text;
                      if (password != repeatPassword) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                          ),
                        );
                        return;
                      }

                      if (email.isNotEmpty && password.isNotEmpty) {
                        context.read<SignUpBloc>().add(OnSignUp(
                            params: Params(email: email, password: password)));
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text('Already have an account'),
                  const SizedBox(height: 5),
                  TextButton(
                      child: const Text('Sign In'),
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/'))
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
