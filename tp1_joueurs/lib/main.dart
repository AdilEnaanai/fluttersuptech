import 'package:flutter/material.dart';
import 'widgets/player_card.dart';
import 'data/player_data.dart';

//https://github.com/AdilEnaanai/fluttersuptech
void main() {
  runApp(const myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Joueurs',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Liste des joueurs',
            style: TextStyle(
              fontSize: 24,
              color: const Color.fromARGB(255, 14, 14, 14),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final player = players[index];
            return PlayerCard(
              name: player['name']!,
              position: player['position']!,
              age: player['age']!,
              origin: player['origin']!,
              description: player['description']!,
              imageUrl: player['imageUrl']!,
            );
          },
        ),
      ),
    );
  }
}
