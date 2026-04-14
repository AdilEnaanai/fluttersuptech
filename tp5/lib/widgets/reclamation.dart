import 'package:flutter/material.dart';
import 'package:tp5/model/Reclamation.dart';
import 'package:tp5/pages/details.dart';

class ReclamationWidget extends StatelessWidget {
  final int index;
  final Function(int index, String newStatus) onStatusChanged;
  final Reclamation reclamation;
  ReclamationWidget({
    required this.reclamation,
    required this.onStatusChanged,
    required this.index,
  });
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
        onTap: () async {
          final newStatus = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Reclamation_details(reclamation: reclamation),
            ),
          );
          if (newStatus != null) {
            onStatusChanged(index, newStatus);
          }
        },
      ),
    );
  }
}
