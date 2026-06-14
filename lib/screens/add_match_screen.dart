import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/matchmodel.dart';
import '../providers/match_providers.dart';


class AddMatchScreen extends StatefulWidget {
  final MatchModel? match;

  const AddMatchScreen({
    super.key,
    this.match,
  });

  @override
  State<AddMatchScreen> createState() =>
      _AddMatchScreenState();
}

class _AddMatchScreenState
    extends State<AddMatchScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _team1Controller;
  late TextEditingController _team2Controller;
  late TextEditingController _scoreController;
  late TextEditingController _statusController;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _team1Controller = TextEditingController(
      text: widget.match?.team1 ?? '',
    );

    _team2Controller = TextEditingController(
      text: widget.match?.team2 ?? '',
    );

    _scoreController = TextEditingController(
      text: widget.match?.score ?? '',
    );

    _statusController = TextEditingController(
      text: widget.match?.status ?? '',
    );
  }

  @override
  void dispose() {
    _team1Controller.dispose();
    _team2Controller.dispose();
    _scoreController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  Future<void> _saveMatch() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final provider = Provider.of<MatchProvider>(
      context,
      listen: false,
    );

    final match = MatchModel(
      id: widget.match?.id,
      team1: _team1Controller.text.trim(),
      team2: _team2Controller.text.trim(),
      score: _scoreController.text.trim(),
      status: _statusController.text.trim(),
    );

    try {
      if (widget.match == null) {
        await provider.addMatch(match);
      } else {
        await provider.updateMatch(
          widget.match!.id!,
          match,
        );
      }

      if (mounted) {
        Navigator.pop(context);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(
        SnackBar(
          content: Text(
            'Error: $e',
          ),
        ),
      );
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit =
        widget.match != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEdit
              ? 'Edit Match'
              : 'Add Match',
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Form(
          key: _formKey,

          child: ListView(
            children: [
              TextFormField(
                controller:
                _team1Controller,

                decoration:
                const InputDecoration(
                  labelText: 'Team 1',
                  border:
                  OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return 'Enter Team 1';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller:
                _team2Controller,

                decoration:
                const InputDecoration(
                  labelText: 'Team 2',
                  border:
                  OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return 'Enter Team 2';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller:
                _scoreController,

                decoration:
                const InputDecoration(
                  labelText: 'Score',
                  border:
                  OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return 'Enter Score';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller:
                _statusController,

                decoration:
                const InputDecoration(
                  labelText: 'Status',
                  border:
                  OutlineInputBorder(),
                ),

                validator: (value) {
                  if (value == null ||
                      value.isEmpty) {
                    return 'Enter Status';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                height: 50,

                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : _saveMatch,

                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                    isEdit
                        ? 'Update Match'
                        : 'Add Match',
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