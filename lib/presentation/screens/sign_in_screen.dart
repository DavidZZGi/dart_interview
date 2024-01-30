import 'package:dart_interview/data/entities/user.dart';
import 'package:dart_interview/data/entities/user_param.dart';
import 'package:dart_interview/presentation/state_managament/global_state_provider/user_state.dart';
import 'package:dart_interview/presentation/state_managament/sign_in_bloc/bloc/sign_in_bloc.dart';
import 'package:dart_interview/presentation/widgets/widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text("Welcome")),
      ),
      body: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state.signInStatus == SignInStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Incorrect credentials')));
            _emailController.clear();
            _passwordController.clear();
          }
          if (state.signInStatus == SignInStatus.success) {
            Navigator.pushReplacementNamed(context, '/home');
          }
          if (state.signInStatus == SignInStatus.newUserError) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please sign up first')));
            _emailController.clear();
            _passwordController.clear();
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const FlutterFormIcon(),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email abc@gmail.com',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 0, bottom: 0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 9, 15, 20),
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(color: Colors.blue),
                        )),
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .setCurrentUser(User(
                              email: _emailController.text,
                              password: _passwordController.text,
                              username:
                                  _emailController.text.split('@').first));
                      context.read<SignInBloc>().add(OnSignIn(
                          params: Params(
                              email: _emailController.text,
                              password: _passwordController.text)));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'New user? ',
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(color: Colors.blue, fontSize: 18),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pushReplacementNamed(context, '/signup');
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
