class Reports {
  String? reportManagerissues;
  String? reportid;
  String? id;
  String from;
  String reportstatus;

  Reports(
      {this.reportManagerissues,
      this.reportid,
      this.id,
      required this.from,
      required this.reportstatus});
  Map<String, dynamic> toJson(docId) => {
        "reportManagerissues": reportManagerissues,
        "reportid": reportid,
        "id": id,
        "from": from,
        "reportstatus": reportstatus,
      };
  factory Reports.fromJson(Map<String, dynamic> json) {
    return Reports(
      reportstatus: json["reportstatus"],
      from: json["from"],
      reportManagerissues: json["reportManagerissues"],
      reportid: json["reportid"],
      id: json["id"],
    );
  }
}
