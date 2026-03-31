import 'package:flutter/material.dart';
import 'package:tp5/model/Reclamarion.dart';
import 'package:tp5/pages/details.dart';

class ReclamationWidget extends StatelessWidget {
  final Reclamation reclamation;
  ReclamationWidget({required this.reclamation});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(reclamation.title),
        subtitle: Text(reclamation.description),
        trailing: Text(
          reclamation.status,
          style: reclamation.status == 'Résolu'
              ? TextStyle(color: Colors.green)
              : TextStyle(color: Colors.orange),
        ),
        leading: CircleAvatar(child: Text(reclamation.id.toString())),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Reclamation_details(reclamation: reclamation),
            ),
          );
        },
      ),
    );
  }
}
