import 'package:flutter/material.dart';

class MatchCard extends StatelessWidget {
  final String team1;
  final String team2;
  final String score;
  final String status;
  final VoidCallback onTap;

  const MatchCard({
    super.key,
    required this.team1,
    required this.team2,
    required this.score,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,

      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),

      child: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                const Icon(
                  Icons.sports_cricket,
                  size: 35,
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    '$team1 vs $team2',

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),

                Container(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                    BorderRadius.circular(
                      20,
                    ),
                  ),

                  child: const Text(
                    'LIVE',

                    style: TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              score,

              style: const TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              status,

              style: const TextStyle(
                color: Colors.green,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton(
                onPressed: onTap,

                child: const Text(
                  'View Details',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}