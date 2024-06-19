class UserModel {
  String? firstname;
  String? email;
  String? lastname;
  String? country;
  String? address;
  String? martialstatus;
  String? aadharnumber;
  String? city;
  // String? contactnumber;
  String? id;
  UserModel({
   required this.firstname,
   required this.email,
   required this.lastname,
   required this.address,
   required this.city,
   required this.aadharnumber,
   required this.martialstatus,
   required this.country,
  //  required this.contactnumber,
    this.id,
  });

  Map<String, dynamic> toJson(docId) => {
        "firstname": firstname,
        "lastname": lastname,
        "country": country,
        "address": address,
        "city": city,
        "email": email,
        "aahaarnumber": aadharnumber,
        "martialstatus": martialstatus,
        // "contactnumber": contactnumber,
        "id": docId,
      };

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        // contactnumber: json["contactnumber"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        country: json["country"],
        address: json["address"],
        city: json["city"],
        email: json["email"],
        aadharnumber: json["aahaarnumber"],
        martialstatus: json["martialstatus"],
        id: json["id"]);
  }
}
