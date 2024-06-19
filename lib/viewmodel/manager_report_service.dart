import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';
import 'package:secure_kare/model/report_model.dart';

class ManagerReportService {
  final db = FirebaseFirestore.instance;
  String id = randomAlphaNumeric(10);
  final usercollection =
      FirebaseFirestore.instance.collection("ManagerReports");
  Future addManagerreports(Reports reports, uid, id) async {
    final doc = db.collection("ManagerReports").doc(id);

    doc.set(reports.toJson(doc.id));
  }
}
