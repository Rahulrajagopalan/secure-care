class WorkersModel {
  String? workersname;
  String? workersplace;
  String? workersage;
  String? workersemail;
  String? workerspassword;
  String? workerimage;
  String? id;
  String agencyId;
  String selectedusertype;
  // List indentity;
  String workassaign;
  WorkersModel({
    required this.workersname,
    required this.agencyId,
    required this.workersplace,
    required this.workersage,
    required this.workersemail,
    required this.workerspassword,
    required this.workerimage,
    required this.selectedusertype,
    // required this.indentity,
    this.id,
    required this.workassaign,
  });

  Map<String, dynamic> toJson(docId) => {
        "workersname": workersname,
        "workersplace": workersplace,
        "workersage": workersage,
        "workersemail": workersemail,
        "workerspassword": workerspassword,
        "workerimage": workerimage,
        "agencyId": agencyId,
        "id": docId,
        'usertype': selectedusertype,
        // 'indentity': indentity,
        'workassign': workassaign,
      };
  factory WorkersModel.fromJson(Map<String, dynamic> json) {
    return WorkersModel(
      workersname: json['workersname'],
      agencyId: json['agencyId'],
      workersplace: json['workersplace'],
      workersage: json['workersage'],
      workersemail: json['workersemail'],
      workerspassword: json['workerspassword'],
      workerimage: json['workerimage'],
      selectedusertype: json['usertype'],
      workassaign: json['workassign'],
    );
  }
}
