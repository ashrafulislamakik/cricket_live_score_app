import 'package:flutter/material.dart';

import 'loginscreen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) =>
            const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Icon(
              Icons.sports_cricket,
              size: 100,
            ),

            SizedBox(height: 20),

            Text(
              "Cricket Live Score",
              style: TextStyle(
                fontSize: 28,
                fontWeight:
                FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}