import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Leaderboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LeaderboardPage(),
    );
  }
}

class Participant {
  final String id;
  final String name;
  int score;
  bool hasChanged;

  Participant({required this.id, required this.name, this.score = 0, this.hasChanged = false});
}

class LeaderboardPage extends StatefulWidget {
  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  List<Participant> participants = [
    Participant(id: "1", name: "Alice"),
    Participant(id: "2", name: "Bob"),
    Participant(id: "3", name: "Charlie"),
    Participant(id: "4", name: "James"),
    Participant(id: "5", name: "Tina"),
    Participant(id: "6", name: "Martha"),
  ];

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      updateScores();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void updateScores() {
    setState(() {
      for (var participant in participants) {
        int scoreDelta = Random().nextInt(21) - 10;
        int newScore = max(0, participant.score + scoreDelta);
        participant.hasChanged = newScore != participant.score;
        participant.score = newScore;
      }
      participants.sort((a, b) => b.score.compareTo(a.score));
    });

    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          for (var participant in participants) {
            participant.hasChanged = false;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.indigo, Colors.purple, Colors.pink],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Card(
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Leaderboard',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: participants.length,
                        itemBuilder: (context, index) {
                          final participant = participants[index];
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                            margin: EdgeInsets.only(bottom: 8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.orange),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${index + 1}. ${participant.name}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                AnimatedDefaultTextStyle(
                                  duration: Duration(milliseconds: 500),
                                  style: TextStyle(
                                    color: participant.hasChanged ? Colors.red : Colors.black,
                                    fontWeight: participant.hasChanged ? FontWeight.bold : FontWeight.normal,
                                  ),
                                  child: Text('${participant.score}'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}