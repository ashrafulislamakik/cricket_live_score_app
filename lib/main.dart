import 'package:cricket_live_score_app/firebase_options.dart';
import 'package:cricket_live_score_app/providers/auth_provider.dart'
as my_auth;
import 'package:cricket_live_score_app/providers/match_providers.dart';
import 'package:cricket_live_score_app/screens/homescreen.dart';
import 'package:cricket_live_score_app/screens/loginscreen.dart';

import 'package:firebase_auth/firebase_auth.dart'
as firebase_auth;

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MatchProvider(),
        ),

        ChangeNotifierProvider(
          create: (_) =>
              my_auth.AuthProvider(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Cricket Live Score',

        theme: ThemeData(
          primarySwatch: Colors.green,
        ),

        home: Consumer<
            my_auth.AuthProvider>(
          builder: (
              context,
              authProvider,
              child,
              ) {
            return StreamBuilder<
                firebase_auth.User?>(
              stream:
              authProvider
                  .authStateChanges,

              builder: (
                  context,
                  snapshot,
                  ) {
                if (snapshot
                    .connectionState ==
                    ConnectionState
                        .waiting) {
                  return const Scaffold(
                    body: Center(
                      child:
                      CircularProgressIndicator(),
                    ),
                  );
                }

                if (snapshot.hasData) {
                  return const HomeScreen();
                }

                return const LoginScreen();
              },
            );
          },
        ),
      ),
    );
  }
}