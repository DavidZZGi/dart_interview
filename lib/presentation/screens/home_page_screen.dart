import 'package:dart_interview/presentation/state_managament/global_state_provider/user_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(Icons.logout),
                          title: const Text('Sign out'),
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/');

                            Provider.of<UserProvider>(context, listen: false)
                                .signOut();
                          },
                        ),
                      ),
                    ])
          ],
          title: const Text('User Account'),
        ),
        body: Consumer<UserProvider>(
          builder: (context, value, child) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome, ${value.currentUser!.username ?? ''}!',
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Text(
                  'Email Address: ${value.currentUser!.email}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ));
          },
        ));
  }
}
