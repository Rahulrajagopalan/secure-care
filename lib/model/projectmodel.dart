import 'package:secure_kare/model/managermodel.dart';

class ProjectDetailsModel {
  String? projectID;
  String agetID;
  String? projectName;
  String? place;
  String? startDate;
  String? endDate;
  String? numberOfWorkers;
  String? budget;
  ManagerModel? manager;
  String? projectimage;
  ProjectDetailsModel(
      {required this.projectName,
      required this.agetID,
      this.projectID,
      required this.place,
      required this.startDate,
      required this.endDate,
      required this.numberOfWorkers,
      required this.budget,
      required this.manager,
      required this.projectimage});
  Map<String, dynamic> toJson(docId, mgrId) => {
        //agentaddprojrct
        "projectID": docId,
        "agetID": agetID,
        "projectName": projectName,
        "place": place,
        "startDate": startDate,
        "endDate": endDate,
        "numberOfWorkers": numberOfWorkers,
        "budget": budget,
        "manager": manager!.toJson(mgrId),
        "projectimage": projectimage
      };
  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProjectDetailsModel(
        agetID: json["agetID"],
        projectID: json["projectID"],
        projectName: json["projectName"],
        place: json["place"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        numberOfWorkers: json["numberOfWorkers"],
        budget: json["budget"],
        manager: ManagerModel.fromJson(json["manager"]),
        projectimage: json["projectimage"]);
  }
}
