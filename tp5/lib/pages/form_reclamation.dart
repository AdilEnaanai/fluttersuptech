import 'package:flutter/material.dart';
import 'package:tp5/model/Reclamation.dart';

class FormReclamation extends StatelessWidget {
  TextEditingController idController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nouvelle réclamation')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: idController,
                decoration: InputDecoration(labelText: 'Id'),
              ),
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Titre'),
                maxLines: 3,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final newReclamation = Reclamation(
                    id: int.parse(idController.text),
                    title: titleController.text,
                    description: descriptionController.text,
                    status: 'En cours',
                  );
                  Navigator.pop(context, newReclamation);
                },
                child: Text('Soumettre'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
