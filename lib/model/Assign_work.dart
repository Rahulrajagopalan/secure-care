class WorkAssign {
  String Workname;
  String workername;
  String? id;
  String Workid;
  String workertype;
  String manager;
  String placework;

  WorkAssign({
    required this.Workname,
    required this.workername,
    this.id,
    required this.Workid,
    required this.workertype,
    required this.manager,
    required this.placework,
  });

  Map<String, dynamic> tojson(idd) => {
        'workername': workername,
        'workename': Workname,
        'workid': Workid,
        'workertype': workertype,
        'manager': manager,
        'id': idd,
        'placework': placework,
      };

  factory WorkAssign.fromjsone(Map<String, dynamic> json) {
    return WorkAssign(
      Workname: json['workername'],
      workername: json['workername'],
      Workid: json['workename'],
      workertype: json['workertype'],
      manager: json['manager'],
      placework: json['placework'],
    );
  }
}
