import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  final String team1;
  final String team2;
  final String score;
  final String status;

  const MatchDetailsScreen({
    super.key,
    required this.team1,
    required this.team2,
    required this.score,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Details'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [
            Card(
              elevation: 5,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceAround,

                      children: [
                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.sports_cricket,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              team1,

                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        const Text(
                          'VS',

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        Column(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              child: Icon(
                                Icons.sports_cricket,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              team2,

                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                        BorderRadius.circular(20),
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

                    const SizedBox(height: 20),

                    Text(
                      score,

                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      status,

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Match Information',

              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading:
                    Icon(Icons.location_on),

                    title: Text('Venue'),

                    subtitle: Text(
                      'Sher-e-Bangla National Stadium',
                    ),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(Icons.sports),

                    title: Text('Match Type'),

                    subtitle: Text(
                      'ODI',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Top Performers',

              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading:
                    Icon(Icons.person),

                    title: Text(
                      'Top Batsman',
                    ),

                    subtitle: Text(
                      'Towhid Hridoy - 78 (65)',
                    ),
                  ),

                  Divider(),

                  ListTile(
                    leading:
                    Icon(Icons.sports_cricket),

                    title: Text(
                      'Top Bowler',
                    ),

                    subtitle: Text(
                      'Taskin Ahmed - 3/42',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Recent Overs',

              style: TextStyle(
                fontSize: 20,
                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,

              children: const [
                Chip(
                  label: Text('1'),
                ),

                Chip(
                  label: Text('4'),
                ),

                Chip(
                  label: Text('0'),
                ),

                Chip(
                  label: Text('6'),
                ),

                Chip(
                  label: Text('W'),
                ),

                Chip(
                  label: Text('2'),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,

              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Added to Favorites',
                      ),
                    ),
                  );
                },

                icon: const Icon(
                  Icons.favorite_border,
                ),

                label: const Text(
                  'Add to Favorites',
                ),

                style:
                ElevatedButton.styleFrom(
                  padding:
                  const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}