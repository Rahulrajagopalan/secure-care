class Alertmodel {
  String? subject;
  String? description;
  String? id;

  Alertmodel({
    required this.subject,
    required this.description,
    required this.id,
  });
  Map<String, dynamic> toJson(docId) => {
        "subject": subject,
        "description": description,
        "id":docId,

      };
  factory Alertmodel.fromJson(Map<String, dynamic> json) {
    return Alertmodel(
      subject: json["subject"],
      description: json["description"],
      id: json["id"],
    );
  }
}
