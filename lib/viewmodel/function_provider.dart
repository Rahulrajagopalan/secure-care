import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:secure_kare/model/Assign_work.dart';
import 'package:secure_kare/model/agentmodel.dart';
import 'package:secure_kare/model/report_model.dart';
import 'package:secure_kare/model/managermodel.dart';
import 'package:secure_kare/model/projectmodel.dart';
import 'package:secure_kare/model/usermodel.dart';
import 'package:secure_kare/model/workersmodel.dart';
import 'package:secure_kare/view/admin/admin_home.dart';

import 'package:secure_kare/view/manager/screen_home_manager.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class FunProvider extends ChangeNotifier {
  String? imageurl = "";
  String? imageurllicense = "";
  String? imageurlpasspot = "";
  String imageurladhaar = "";
  String? uid = "";
  UserModel? usermodelobj;
  AgentModel? agentmodelobj;
  FirebaseAuth auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  EmailOTP myAuth = EmailOTP();
  final formkey = GlobalKey<FormState>();
  final adminloginkey = GlobalKey<FormState>();
  final formkeyregister = GlobalKey<FormState>();
  List managerlist = [];
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('AGENT');
  FirebaseStorage storage = FirebaseStorage.instance;

  final RegExp emailregexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  final adminuid = "Rhfap5elm7bB1qblOgsef2cjTKR2";
  //          SCREEN REGISTER
  //screen signup

  final emailcontroller = TextEditingController();
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  //SCREEN REGISTER

  //screen otp
  final otpcontroller = TextEditingController();
  //screen login
  final loginusernamecontroller = TextEditingController();
  final loginpasswordcontroller = TextEditingController();
  //screen Userreport problems
  final reportproblemcontroller = TextEditingController();
  //screen Managerreport problems
  final managerreportproblemcontroller = TextEditingController();
  //screenpersonalinformation
  final usernamepcontroller = TextEditingController();
  final userplacecontroller = TextEditingController();
  final useragecontroller = TextEditingController();
  final usersercontroller = TextEditingController();
  final useridnumbercontroller = TextEditingController();
  final useremailcontroller = TextEditingController();
  final useridcontroller = TextEditingController();
  final userpasswordcontroller = TextEditingController();

//Agent Controller
  final agencynamecontroller = TextEditingController();
  final agentaddresscontroller = TextEditingController();
  final agentcompanynamecontroller = TextEditingController();
  final agentcontactnumbercontrroller = TextEditingController();
  final agentstatecontroller = TextEditingController();
  final agentcitycontroller = TextEditingController();
  final agentemailecontroller = TextEditingController();
  final agentpasswordcontroller = TextEditingController();
  final agentconfirmpasswordcontroller = TextEditingController();
  final agentwebsitecontroller = TextEditingController();
  //admin(Register As an Employee)
  final agencyname = TextEditingController();
  final agentcontactnumber = TextEditingController();
  final agentrgstate = TextEditingController();
  final agentrgaddress = TextEditingController();
  final agentrgcity = TextEditingController();
  final agentrgemail = TextEditingController();
  final policeloginemail = TextEditingController();
  final policeloginpassword = TextEditingController();

  final agentcompanyname = TextEditingController();
  final agentrgpassword = TextEditingController();
  //AGENT Add Project

  //Agent AddManager

  //Agent Add Workers

  final workerlogemail = TextEditingController();

  final workerlogpassword = TextEditingController();
  //update
  final workernameupdate = TextEditingController();
  final workerplaceupdate = TextEditingController();
  final workerageupdate = TextEditingController();

  //update agent profile

  var agentupdatename = TextEditingController();
  final agentupdateaddress = TextEditingController();
  final agentupdatecity = TextEditingController();
  final agentupdatestate = TextEditingController();
  final agentupdatecontactnumber = TextEditingController();
  final agentupdateemail = TextEditingController();
  final agentupdatepassword = TextEditingController();

  //managerController
  final managernamecontroller = TextEditingController();
  final manageraddresscontroller = TextEditingController();
  final managercontactnumbercontroller = TextEditingController();
  final managerstatecontroller = TextEditingController();
  final managercitycontroller = TextEditingController();
  final manageremailcontroller = TextEditingController();
  final managerpasswordcontroller = TextEditingController();

  //police
  final policenamecontroller = TextEditingController();
  final policeaddresscontroller = TextEditingController();
  final policecontactnumbercontroller = TextEditingController();
  final policestatecontroller = TextEditingController();
  final policecitycontroller = TextEditingController();
  final policeemailcontroller = TextEditingController();
  final policepasswordcontroller = TextEditingController();
  //admin
  final adminemailcontroller = TextEditingController();
  final adminpasswordcontroller = TextEditingController();
  //managerLOGIN
  final managerloginemail = TextEditingController();
  final managerloginpassword = TextEditingController();
  //Agent Login

  Future logout(
    context,
  ) async {
    auth.signOut();
  }

  bool obscuretext = false;

  toggle() {
    obscuretext = !obscuretext;
    notifyListeners();
  }

  Future addworkassign(WorkAssign workAssign) async {
    final snapshot = await db.collection('Work Assign').doc();

    snapshot.set(workAssign.tojson(snapshot.id));
  }

  // Future signup(context) async {
  //   try {
  //     await auth
  //         .createUserWithEmailAndPassword(
  //             email: emailidcontroller.text, password: passwordcontroller.text)
  //         .then((value) {
  //       firestore.addUser(
  //           UserModel(
  //               contactnumber: usercontactnumbercontroller.text,
  //               firstname: firstnamecontroller.text,
  //               lastname: lastnamecontroller.text,
  //               country: countrycontroller.text,
  //               address: addresscontroller.text,
  //               city: citycontroller.text,
  //               email: emailidcontroller.text,
  //               aadharnumber: aadhaarcontroller.text,
  //               martialstatus: meterialstatuscontroller.text),
  //           value.user!.uid);
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == "email-already-in-use") {
  //       return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         duration: Duration(seconds: 3),
  //         backgroundColor: Color.fromARGB(255, 159, 58, 58),
  //         content: Text("invalid  email"),
  //         action: SnackBarAction(
  //           label: "Undo",
  //           textColor: Colors.white,
  //           onPressed: () {},
  //         ),
  //       ));
  //     }
  //   }
  // }

  // verifyemail() async {
  //   await auth.currentUser?.sendEmailVerification();
  // }

  // signin() async {
  //   await auth
  //       .signInWithEmailAndPassword(
  //           email: emailidcontroller.text, password: passwordcontroller.text)
  //       .then((credentisl) {
  //     if (credentisl.user!.emailVerified) {
  //     } else {
  //       credentisl.user!.sendEmailVerification();
  //     }
  //   });
  // }

  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

//screen register
  // Uint8List? _image;
  // File? images;
  // String uploadurl = "";
  // imagePick2(ImageSource source) async {
  //   final ImagePicker _imagepicker = ImagePicker();
  //   XFile? _file = await _imagepicker.pickImage(source: source);
  //   if (_file != null) {
  //     return await _file.readAsBytes();
  //   }
  //   print("No iMagevselected");
  //   // XFile? pickedImage =
  //   //     await ImagePicker().pickImage(source: ImageSource.gallery);
  //   // if (pickedImage != null) {
  //   //   images = File(pickedImage.path);
  //   //   Reference storageurl = FirebaseStorage.instance.ref().child(images!.path);
  //   //   print(storageurl);

  //   //   UploadTask uploadimages = storageurl.putFile(images!);
  //   //   uploadurl =
  //   //       await uploadimages.then((result) => result.ref.getDownloadURL());
  //   // }
  // }

  // void selectimage() async {
  //   Uint8List img = await imagePick2(ImageSource.gallery);
  //   _image = img;

  // }

//screen register

  // countrypicker(context) async {
  //   return showCountryPicker(
  //     context: context,
  //     showPhoneCode: true,
  //     onSelect: (Country country) {
  //       print('Select country: ${country.displayName}');
  //     },
  //   );
  // }

  String? selectedtype;

  void valuechange(value) {
    selectedtype = value as String;
  }

  final updateagentname = TextEditingController();

  //admin login function
  checkadminemail(context, _email, _passowrd) {
    auth
        .signInWithEmailAndPassword(email: _email, password: _passowrd)
        .then((credential) {
      if (credential.user!.uid == adminuid) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => AdminHome(),
            ),
            (route) => false);
      } else {
        auth.signOut();
        return ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Email and Password is Doesn't match")));
      }
    }).onError((error, stackTrace) {
      return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Email and Password is Doesn't Match")));
    });
  } //////////////////////////////////////////////////////////////////////////////////////

  // imagePick(ImageSource source) async {
  //   final ImagePicker _imagepicker = ImagePicker();
  //   XFile? _file = await _imagepicker.pickImage(source: source);
  //   if (_file != null) {
  //     return await _file.readAsBytes();
  //   }
  //   print("No iMagevselected");
  // }

  // Uint8List? _image;

  // imagePickfromgallery(ImageSource source) async {
  //   final ImagePicker _imagepicker = ImagePicker();
  //   XFile? _file = await _imagepicker.pickImage(source: source);
  //   if (_file != null) {
  //     return await _file.readAsBytes();
  //   }
  //   print("No iMagevselected");
  // }

  // void selectimage() async {
  //   notifyListeners();
  //   Uint8List img = await imagePickfromgallery(ImageSource.gallery);

  //   _image = img;
  //   notifyListeners();
  // }

// screenAddworkers//
  Future pickimagefromgallery() async {
    ImagePicker imagePicker = ImagePicker();
    SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print(".................${file?.path}");
    if (file == null) return;
    String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referencRoot = FirebaseStorage.instance.ref();
    Reference referencedirimage = referencRoot.child("images");
    Reference referencetoimageupload = referencedirimage.child(uniquefilename);
    try {
      await referencetoimageupload.putFile(File(file.path), metadata);
      imageurl = await referencetoimageupload.getDownloadURL();
      print(imageurl);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  pickimageforadhaar() async {
    ImagePicker imagePicker = ImagePicker();
    SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print(".................${file?.path}");
    if (file == null) return;
    String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referencRoot = FirebaseStorage.instance.ref();
    Reference referencedirimage = referencRoot.child("images");
    Reference referencetoimageupload = referencedirimage.child(uniquefilename);
    try {
      await referencetoimageupload.putFile(File(file.path), metadata);
      imageurladhaar = await referencetoimageupload.getDownloadURL();
      print(imageurllicense);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  pickimageforlicense() async {
    ImagePicker imagePicker = ImagePicker();
    SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print(".................${file?.path}");
    if (file == null) return;
    String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referencRoot = FirebaseStorage.instance.ref();
    Reference referencedirimage = referencRoot.child("images");
    Reference referencetoimageupload = referencedirimage.child(uniquefilename);
    try {
      await referencetoimageupload.putFile(File(file.path), metadata);
      imageurllicense = await referencetoimageupload.getDownloadURL();
      print(imageurllicense);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  List<File> _imageList = [];

  pickimageforpassport() async {
    ImagePicker imagePicker = ImagePicker();
    SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    print(".................${file?.path}");
    if (file == null) return;
    String uniquefilename = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referencRoot = FirebaseStorage.instance.ref();
    Reference referencedirimage = referencRoot.child("images");
    Reference referencetoimageupload = referencedirimage.child(uniquefilename);
    try {
      await referencetoimageupload.putFile(File(file.path), metadata);
      imageurlpasspot = await referencetoimageupload.getDownloadURL();
      print(imageurlpasspot);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  Future<void> userprofileupdate(
    context,
    String name,
    place,
    age,
  ) async {
    workernameupdate.text = name;
    workerplaceupdate.text = place;
    workerageupdate.text = age;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(
              "Edit name",
              style: GoogleFonts.anekDevanagari(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: workernameupdate,
                  style: GoogleFonts.overpass(),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: "Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: workerplaceupdate,
                  style: GoogleFonts.overpass(),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: 'Place',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: workerageupdate,
                  style: GoogleFonts.overpass(),
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      labelText: 'Age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: GoogleFonts.nunito(color: Colors.white),
                )),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.indigo),
                onPressed: () {
                  final CollectionReference agent =
                      FirebaseFirestore.instance.collection("ACCEPTED WORKERS");
                  print("update");
                  update();
                  Navigator.pop(context);
                },
                child: Text(
                  "Update",
                  style: GoogleFonts.nunito(color: Colors.white),
                )),
          ],
        );
      },
    );
  }

  update() {
    final DocumentReference<Map<String, dynamic>> user = FirebaseFirestore
        .instance
        .collection("ACCEPTED WORKERS")
        .doc(FirebaseAuth.instance.currentUser!.uid);
    user.update({
      "workersname": workernameupdate.text,
      "workersplace": workerplaceupdate.text,
      "workersage": workerageupdate.text,
    });
  }

  sendEmail(String subject, String body, String recipientmail) async {
    final Email email = Email(
        body: body,
        subject: subject,
        recipients: [recipientmail],
        isHTML: false);
    await FlutterEmailSender.send(email);
  }

  //
  //signupwithworkers

  //Signupwith manager

  //Signupwith Agent

//login worker
  signin(context) async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: workerlogemail.text, password: workerlogpassword.text)
          .then(
        (credential) {
          String id = credential.user!.uid;

          print(id);
          final snackBar = SnackBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            content: Text(
              "Login Succesfully",
              style: GoogleFonts.sarabun(),
            ),
          );

          // Display the Snackbar
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return ScreenUserHome();
            },
          ));
        },
      );
    } catch (e) {
      print("ccccccccccccccccccccccccccccccc");
      print(e.toString());
      final snackBar = SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Check Your Emai and Password",
          style: GoogleFonts.plusJakartaSans(),
        ),
        action: SnackBarAction(
          label: 'Undo',
          textColor: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Display the Snackbar
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  //signwithmanager.......................
  Loginwithmanager(context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: managerloginemail.text, password: managerloginpassword.text)
          .then(
        (credential) async {
          String id = credential.user!.uid;

          final snaps = await db.collection("MANAGER").doc(id).get();
          if (snaps.exists) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              content: Text(
                "Login Succesfully",
                style: GoogleFonts.sarabun(),
              ),
            ));
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) {
                return ScreenHomeManager();
              },
            ), (route) => false);
          } else {
            auth.signOut();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                "User not Found in this email address",
                style: GoogleFonts.plusJakartaSans(),
              ),
              action: SnackBarAction(
                label: 'Undo',
                textColor: const Color.fromARGB(255, 0, 0, 0),
                onPressed: () {
                  // Some code to undo the change.
                },
              ),
            ));
          }

          // Display the Snackbar
        },
      );
    } catch (e) {
      print(e.toString());

      // Display the Snackbar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          "Check Your Emai and Password",
          style: GoogleFonts.plusJakartaSans(),
        ),
        action: SnackBarAction(
          label: 'Undo',
          textColor: const Color.fromARGB(255, 0, 0, 0),
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      ));
    }
  }

  ///Logi With Agent
  ///

  WorkersModel? workersModel;
  String? workname;
  String? workplace;
  String? workage;
  String? workidnumber;
  String? workemail;
  String? workid;
  String? workpassword;
  String? workimage;

  fetchCurrentUserData() async {
    final snapshot = await FirebaseFirestore.instance
        .collection("ACCEPTED WORKERS")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      workersModel = WorkersModel.fromJson(snapshot.data()!);
      workname = workersModel!.workersname;
      workplace = workersModel!.workersplace;
      workage = workersModel!.workersage;
      workemail = workersModel!.workersemail;
      workpassword = workersModel!.workerspassword;
      workimage = workersModel!.workerimage;

      print(workname);
      print(workersModel!.workersage);
      print(workersModel!.workersplace);
    }
  } //fetchmanagerdata/..............................

  ManagerModel? managermodel;
  String? managername;
  String? managerplace;
  String? managerage;
  String? manageridnumber;
  String? manageremail;
  String? managerid;
  String? managerpassword;
  String? managerimage;

  fetchCurrentmaangerdata() async {
    print('obje..........................................................');
    print(FirebaseAuth.instance.currentUser!.uid);
    print('bje..........................................................');
    final snapshot = await FirebaseFirestore.instance
        .collection("MANAGER")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      print("ttttttttttttttttttttttttttttttttttttttttttttttt");
      managermodel = ManagerModel.fromJson(snapshot.data()!);
      managername = managermodel!.managername;
      managerplace = managermodel!.managerplace;
      managerage = managermodel!.managerage;
      // manageridnumber = managermodel!.manageridnumber;
      manageremail = managermodel!.manageremail;
      // managerid = managermodel!.managerid;
      managerpassword = managermodel!.managerpassword;
      managerimage = imageurl;
      print(managername);
      print("VVvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
      print(managermodel!.managername);
    }
  }

  //fetch agent data
  AgentModel? agentModel;
  // String? agentname;
  // String? agentaddress;
  // String? agentcity;
  // String? agentcntctctnumber;
  // String? agentemail;
  // String? agentstate;
  // String? agentpassword;
  // String? agentimage;

// SPECIFIED DATA FETCHING FROM ONE COLLECTION IN SCREEN
//userreport
  List<Reports> userreportModel = [];
  Future getreport() async {
    final snapshot = await db
        .collection('Reports')
        .where(
          'reportid',
          isEqualTo: auth.currentUser!.uid,
        )
        .get();

    userreportModel = snapshot.docs.map((doc) {
      return Reports.fromJson(doc.data());
    }).toList();
  }

  ///////////////////////////////////////////////

  List<Reports> managerreports = [];
  Future getreportmanager() async {
    final snapshot = await db
        .collection('Reports')
        .where(
          'reportid',
          isEqualTo: auth.currentUser!.uid,
        )
        .get();

    managerreports = snapshot.docs.map((doc) {
      return Reports.fromJson(doc.data());
    }).toList();
  }

  Stream<List<ProjectDetailsModel>> getInstitutionsStream() {
    return FirebaseFirestore.instance
        .collection('PROJECT').where("manager")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProjectDetailsModel.fromJson(doc.data());
      }).toList();
    });
  }
}
