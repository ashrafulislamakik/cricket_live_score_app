import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.sports_cricket,
                size: 100,
              ),

              const SizedBox(height: 30),

              const Text(
                "Cricket Live Score",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(height: 50),

              ElevatedButton.icon(
                onPressed: () {},

                icon: const Icon(
                  Icons.login,
                ),

                label: const Text(
                  "Sign in with Google",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}