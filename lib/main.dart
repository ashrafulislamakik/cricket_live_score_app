import 'package:cricket_live_score_app/providers/match_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/homescreen.dart';

import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';


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
    return ChangeNotifierProvider(
      create: (_) => MatchProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cricket Live Score',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}