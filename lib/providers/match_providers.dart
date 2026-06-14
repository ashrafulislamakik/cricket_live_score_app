import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/matchmodel.dart';

class MatchProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  List<MatchModel> _matches = [];

  List<MatchModel> get matches => _matches;

  MatchProvider() {
    fetchMatches();
  }

  void fetchMatches() {
    _firestore
        .collection('matches')
        .snapshots()
        .listen((snapshot) {
      _matches = snapshot.docs
          .map(
            (doc) => MatchModel.fromMap(
          doc.data(),
          doc.id,
        ),
      )
          .toList();

      notifyListeners();
    });
  }

  Future<void> addMatch(
      MatchModel match,
      ) async {
    await _firestore
        .collection('matches')
        .add(match.toMap());
  }

  Future<void> updateMatch(
      String id,
      MatchModel match,
      ) async {
    await _firestore
        .collection('matches')
        .doc(id)
        .update(match.toMap());
  }

  Future<void> deleteMatch(
      String id,
      ) async {
    await _firestore
        .collection('matches')
        .doc(id)
        .delete();
  }
}