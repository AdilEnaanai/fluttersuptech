import 'package:flutter/material.dart';

class Tache extends StatelessWidget {
  final String title;
  final String description;
  final String state;

  const Tache({
    super.key,
    required this.title,
    required this.description,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(description),
        trailing: Text(
          state,
          style: TextStyle(
            color: state == 'Terminé' ? Colors.green : Colors.orange,
          ),
        ),
      ),
    );
  }
}
