class ManagerModel {
  String? managername;
  String? managerplace;
  String agencyId;
  String? managerage;
  // String? manageridnumber;
  // String? managerid;
  String? manageremail;
  String? managerimage;
  String? managergender;
  String? id;

  String? managerpassword;
  ManagerModel(
      {required this.managername,
      required this.agencyId,
      required this.managerplace,
      required this.managerage,
      required this.manageremail,
      required this.managerpassword,
      required this.managergender,
      required this.managerimage,
      this.id});

  get isEmpty => null;

  get length => null;
  Map<String, dynamic> toJson(docId) => {
        "id": docId,
        "agencyId": agencyId,
        "managername": managername,
        "managerplace": managerplace,
        "managerage": managerage,
        "manageremail": manageremail,
        "managerpassword": managerpassword,
        "managergender": managergender,
        "managerimage": managerimage,
      };
  factory ManagerModel.fromJson(Map<String, dynamic> json) {
    return ManagerModel(
      agencyId: json["agencyId"],
      id: json["id"],
      managername: json["managername"],
      managerplace: json["managerplace"],
      managerage: json["managerage"],
      manageremail: json["manageremail"],
      managerpassword: json["managerpassword"],
      managergender: json["managergender"],
      managerimage: json["managerimage"],
    );
  }
}
