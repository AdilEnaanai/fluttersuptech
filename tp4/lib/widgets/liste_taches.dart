import 'package:flutter/material.dart';
import 'package:tp4/widgets/tache.dart';

class ListeTaches extends StatefulWidget {
  const ListeTaches({super.key});

  @override
  State<ListeTaches> createState() => _ListeTachesState();
}

class _ListeTachesState extends State<ListeTaches> {
  List<Tache> taches = [
    const Tache(
      title: 'Tache 1',
      description: 'Description de la tache 1',
      state: 'En cours',
    ),
    const Tache(
      title: 'Tache 2',
      description: 'Description de la tache 2',
      state: 'Terminé',
    ),
    const Tache(
      title: 'Tache 3',
      description: 'Description de la tache 3',
      state: 'En cours',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liste des tâches')),
      body: ListView.builder(
        itemCount: taches.length,
        itemBuilder: (context, index) {
          return taches[index];
        },
      ),
    );
  }
}
