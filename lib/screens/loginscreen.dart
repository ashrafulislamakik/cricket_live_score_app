import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider =
    Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Google Sign-In',
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding:
          const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [
              const Icon(
                Icons.sports_cricket,
                size: 100,
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                'Cricket Live Score',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              const Text(
                'Sign in with Google',
                textAlign:
                TextAlign.center,
              ),

              const SizedBox(
                height: 40,
              ),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton.icon(
                  onPressed:
                  authProvider
                      .isLoading
                      ? null
                      : () async {
                    try {
                      await authProvider
                          .signInWithGoogle();
                    } catch (e) {
                      if (context
                          .mounted) {
                        ScaffoldMessenger
                            .of(
                          context,
                        )
                            .showSnackBar(
                          SnackBar(
                            content:
                            Text(
                              'Login Failed: $e',
                            ),
                          ),
                        );
                      }
                    }
                  },

                  icon: authProvider
                      .isLoading
                      ? const SizedBox(
                    width: 20,
                    height: 20,
                    child:
                    CircularProgressIndicator(),
                  )
                      : const Icon(
                    Icons.login,
                  ),

                  label: Text(
                    authProvider
                        .isLoading
                        ? 'Signing In...'
                        : 'Continue with Google',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}