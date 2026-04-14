import 'package:flutter/material.dart';
import 'package:tp5/model/Reclamation.dart';

class Reclamation_details extends StatelessWidget {
  final Reclamation reclamation;
  Reclamation_details({required this.reclamation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(reclamation.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(reclamation.description, style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            Text(
              'Status:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(reclamation.status, style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'Résolu');
              },
              child: Text('Marquer comme résolu'),
            ),
          ],
        ),
      ),
    );
  }
}
