import 'package:flutter/material.dart';
import 'package:tp5/model/Reclamation.dart';
import 'package:tp5/pages/form_reclamation.dart';
import 'package:tp5/widgets/reclamation.dart';

class ReclamationPage extends StatefulWidget {
  const ReclamationPage({super.key, required this.title});
  final String title;
  @override
  State<ReclamationPage> createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  List<Reclamation> reclamations = [
    Reclamation(
      id: 1,
      title: 'Problème de connexion',
      description: 'Je ne peux pas me connecter à mon compte.',
      status: 'En cours',
    ),
    Reclamation(
      id: 2,
      title: 'Erreur de paiement',
      description: 'Mon paiement a été refusé sans raison.',
      status: 'Résolu',
    ),
    Reclamation(
      id: 3,
      title: 'Produit défectueux',
      description: 'Le produit que j\'ai reçu est cassé.',
      status: 'En cours',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        itemCount: reclamations.length,
        itemBuilder: (context, index) {
          return ReclamationWidget(
            index: index,
            reclamation: reclamations[index],
            onStatusChanged: (index, newStatus) {
              setState(() {
                reclamations[index].status = newStatus;
              });
            },
            onReclamationDelete: (index) {
              setState(() {
                reclamations.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("Ouvre formulaire de réclamation");
          final newReclamation = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormReclamation()),
          );

          if (newReclamation != null) {
            setState(() {
              reclamations.add(newReclamation);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
