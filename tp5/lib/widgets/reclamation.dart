import 'package:flutter/material.dart';
import 'package:tp5/model/Reclamation.dart';
import 'package:tp5/pages/details.dart';
import 'package:tp5/pages/reclamation_page.dart';

class ReclamationWidget extends StatelessWidget {
  final int index;
  final Function(int index, String newStatus) onStatusChanged;
  final Function(int index) onReclamationDelete;
  final Reclamation reclamation;
  ReclamationWidget({
    required this.reclamation,
    required this.onStatusChanged,
    required this.onReclamationDelete,
    required this.index,
  });

  Future<void> _confirmerSuppression(BuildContext context, int index) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Suppression d\'une réclamation'),
          content: Text(
            'Voulez vous vraiment supprimer cette réclamation?\n\n Cette opération est irreversible',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text('Annuler'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text('Supprimer'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        );
      },
    );
    if (confirmed == true) {
      onReclamationDelete(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(reclamation.title),
        subtitle: Text(reclamation.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              reclamation.status,
              style: reclamation.status == 'Résolu'
                  ? TextStyle(color: Colors.green)
                  : TextStyle(color: Colors.orange),
            ),
            IconButton(
              onPressed: () {
                _confirmerSuppression(context, index);
              },
              icon: Icon(
                Icons.delete,
                color: const Color.fromARGB(255, 192, 19, 7),
              ),
            ),
          ],
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
