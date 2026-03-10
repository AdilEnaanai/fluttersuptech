import 'package:flutter/material.dart';
import 'info_row.dart';

class PlayerCard extends StatelessWidget {
  final String name;
  final String position;
  final String origin;
  final String age;
  final String description;
  final String imageUrl;

  const PlayerCard({
    super.key,
    required this.name,
    required this.position,
    required this.age,
    required this.origin,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(10),
        child: Column(
          children: [
            Text(
              this.name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 15, 104, 227),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoRow(icon: "🌍", label: "Origine", value: this.origin),
                    InfoRow(icon: "⚽", label: "Poste", value: this.position),
                    InfoRow(icon: "🎂", label: "Age", value: this.age),
                  ],
                ),
                trailing: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(this.imageUrl),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 240, 240),
                border: Border(
                  bottom: BorderSide(
                    color: const Color.fromARGB(255, 15, 104, 227),
                  ),
                  top: BorderSide(
                    color: const Color.fromARGB(255, 15, 104, 227),
                  ),
                  left: BorderSide(
                    color: const Color.fromARGB(255, 205, 41, 4),
                  ),
                  right: BorderSide(
                    color: const Color.fromARGB(255, 205, 41, 4),
                  ),
                ),
              ),
              padding: const EdgeInsets.all(8),
              child: Text(this.description, textAlign: TextAlign.justify),
            ),
          ],
        ),
      ),
    );
  }
}
