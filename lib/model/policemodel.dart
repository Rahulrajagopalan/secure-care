class PoliceModel {
  String? policename;
  String? policeaddress;
  String? policecontactnumber;
  String? policestate;
  String? policecity;
  String? policeemail;
  String? policepassword;
  PoliceModel(
      {this.policename,
      this.policeaddress,
      this.policecontactnumber,
      this.policestate,
      this.policecity,
      this.policeemail,
      this.policepassword});
  Map<String, dynamic> toJson(docId) => {
        "policename": policename,
        "policeaddress": policeaddress,
        "policecontactnumber": policecontactnumber,
        "policestate": policestate,
        "policecity": policecity,
        "policeemail": policeemail,
        "policepassword": policepassword,
      };
  factory PoliceModel.fromJson(Map<String, dynamic> json) {
    return PoliceModel(
      policename: json["policename"],
      policeaddress: json["policeaddress"],
      policecontactnumber: json["policecontactnumber"],
      policestate: json["policestate"],
      policecity: json["policecity"],
      policeemail: json["policeemail"],
      policepassword: json["policepassword"],
    );
  }
}
