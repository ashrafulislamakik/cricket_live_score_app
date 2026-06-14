class MatchModel {
  final String? id;
  final String team1;
  final String team2;
  final String score;
  final String status;

  MatchModel({
    this.id,
    required this.team1,
    required this.team2,
    required this.score,
    required this.status,
  });

  factory MatchModel.fromMap(
      Map<String, dynamic> map,
      String documentId,
      ) {
    return MatchModel(
      id: documentId,
      team1: map['team1'] ?? '',
      team2: map['team2'] ?? '',
      score: map['score'] ?? '',
      status: map['status'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'team1': team1,
      'team2': team2,
      'score': score,
      'status': status,
    };
  }
}