import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService =
  AuthService();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  User? get user =>
      _authService.currentUser;

  Stream<User?> get authStateChanges =>
      _authService.authStateChanges;

  Future<void> signInWithGoogle() async {
    try {
      _isLoading = true;
      notifyListeners();

      await _authService
          .signInWithGoogle();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    notifyListeners();
  }
}