import 'package:flutter/material.dart';
import 'package:tp5/model/Reclamation.dart';
import 'package:tp5/pages/form_reclamation.dart';
import 'package:tp5/services/reclamation_service.dart';
import 'package:tp5/widgets/reclamation.dart';

class ReclamationPage extends StatefulWidget {
  const ReclamationPage({super.key, required this.title});
  final String title;
  @override
  State<ReclamationPage> createState() => _ReclamationPageState();
}

class _ReclamationPageState extends State<ReclamationPage> {
  List<Reclamation> reclamations = [];

  ScrollController _scrollController = ScrollController();
  int currentPage = 1;

  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    _loadReclamations();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadMoreReclamations();
      }
      ;
    });
  }

  Future<void> _loadReclamations() async {
    currentPage = 1;
    final data = await ReclamationService.getReclamations();

    setState(() {
      this.reclamations = data;
    });
  }

  Future<void> _loadMoreReclamations() async {
    if (isLoadingMore == true) return;
    currentPage++;
    isLoadingMore = true;
    final data = await ReclamationService.getReclamations(
      page: currentPage,
      limit: 20,
    );

    setState(() {
      this.reclamations.addAll(data);
      isLoadingMore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        controller: _scrollController,
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
