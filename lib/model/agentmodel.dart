class AgentModel {
  // agent

  String? agencyname;

  String? agentstate;
  String? agentaddress;

  String? agentcity;
  String? agentemail;
  String? contactnumber;

  String? password;
  String? id;
  String? image;

  AgentModel(
      {
      //agent

      required this.agencyname,
      required this.agentstate,
      required this.agentaddress,
      required this.agentcity,
      required this.agentemail,
      required this.contactnumber,
      required this.password,
       this.id,
      required this.image});
  Map<String, dynamic> toJson(docId) => {
        //agent

        "agencyname": agencyname,
        "agentaddress": agentaddress,
        "agentstate": agentstate,

        "agentcity": agentcity,
        "agentemail": agentemail,
        "contactnumber": contactnumber,

        "password": password,

        "image": image,
        "id":docId,

      };
  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      agencyname: json["agencyname"],
      agentaddress: json["agentaddress"],
      agentcity: json["agentcity"],
      agentemail: json["agentemail"],
      agentstate: json["agentstate"],
      contactnumber: json["contactnumber"],
      password: json["password"],
      id: json["id"],
      image: json["image"],
    );
  }
}
