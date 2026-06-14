import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/match_providers.dart';
import '../widgets/matchcardwidget.dart';
import 'add_match_screen.dart';
import 'matchdetailsscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final matchProvider =
    Provider.of<MatchProvider>(
      context,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cricket Live Score',
        ),
        centerTitle: true,
      ),

      body:
      matchProvider.matches.isEmpty
          ? const Center(
        child: Text(
          'No Match Available',
        ),
      )
          : ListView.builder(
        itemCount: matchProvider
            .matches.length,

        itemBuilder:
            (context, index) {
          final match =
          matchProvider
              .matches[index];

          return Column(
            children: [
              MatchCard(
                team1:
                match.team1,
                team2:
                match.team2,
                score:
                match.score,
                status:
                match.status,

                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(
                      builder:
                          (_) =>
                          MatchDetailsScreen(
                            team1:
                            match.team1,
                            team2:
                            match.team2,
                            score:
                            match.score,
                            status:
                            match.status,
                          ),
                    ),
                  );
                },
              ),

              Padding(
                padding:
                const EdgeInsets.symmetric(
                  horizontal:
                  16,
                ),

                child: Row(
                  children: [
                    Expanded(
                      child:
                      ElevatedButton.icon(
                        onPressed:
                            () {
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder:
                                  (_) =>
                                  AddMatchScreen(
                                    match:
                                    match,
                                  ),
                            ),
                          );
                        },

                        icon:
                        const Icon(
                          Icons
                              .edit,
                        ),

                        label:
                        const Text(
                          'Edit',
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 10,
                    ),

                    Expanded(
                      child:
                      ElevatedButton.icon(
                        style:
                        ElevatedButton.styleFrom(
                          backgroundColor:
                          Colors.red,
                        ),

                        onPressed:
                            () async {
                          await matchProvider
                              .deleteMatch(
                            match.id!,
                          );
                        },

                        icon:
                        const Icon(
                          Icons
                              .delete,
                        ),

                        label:
                        const Text(
                          'Delete',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 15,
              ),
            ],
          );
        },
      ),

      floatingActionButton:
      FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,

            MaterialPageRoute(
              builder:
                  (_) =>
              const AddMatchScreen(),
            ),
          );
        },

        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}