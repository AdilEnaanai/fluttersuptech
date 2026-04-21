class Reclamation {
  int id;
  String title;
  String description;
  String status;

  Reclamation({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
  });

  factory Reclamation.fromJson(Map<String, dynamic> json) {
    return Reclamation(
      id: int.parse(json['id'].toString()),
      title: json['title'],
      description: json['description'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
    };
  }
}
