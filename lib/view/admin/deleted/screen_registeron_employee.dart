// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:secure_kare/model/agentmodel.dart';
// import 'package:secure_kare/viewmodel/agent_store.dart';
// import 'package:secure_kare/viewmodel/function_provider.dart';
// import 'package:secure_kare/viewmodel/ui_work_provider.dart';

// class ScreenRegisteronEmployee extends StatefulWidget {
//   const ScreenRegisteronEmployee({super.key});

//   @override
//   State<ScreenRegisteronEmployee> createState() =>
//       _ScreenRegisteronEmployeeState();
// }

// class _ScreenRegisteronEmployeeState extends State<ScreenRegisteronEmployee> {
//   @override
//   Widget build(BuildContext context) {
//     final funprovider = Provider.of<FunProvider>(context);
//     // final workprovider = Provider.of<WorkProvider>(context);

//     return Scaffold(
//         body: Row(
//       children: [
//         WorkProvider().admindrawer(context),
//         Container(
//           width: 936,
//           height: 800,
//           color: const Color.fromARGB(255, 45, 44, 44),
//           child: Padding(
//             padding: const EdgeInsets.only(left: 200, right: 200),
//             child: SingleChildScrollView(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         funprovider.pickimagefromgallery();
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             color: Colors.white,
//                             border: Border.all(color: Colors.black)),
//                         width: 160,
//                         height: 100,
//                         child:

//                             /// funprovider.images != null
//                             ///  ? Image.file(funprovider.images!)
//                             /// :
//                             Center(
//                           child: Column(
//                             children: [
//                               const SizedBox(
//                                 height: 30,
//                               ),
//                               Text(
//                                 "Place Your image",
//                                 style: GoogleFonts.kanit(
//                                     fontSize: 15, fontWeight: FontWeight.bold),
//                               ),
//                               Icon(Icons.add_box)
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Color.fromARGB(255, 45, 44, 44),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         controller: funprovider.agencyname,
//                         decoration: InputDecoration(
//                             hintText: "Agency Name",
//                             contentPadding: EdgeInsets.all(5),
//                             hintStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Color.fromARGB(255, 45, 44, 44),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         controller: funprovider.agentrgaddress,
//                         decoration: InputDecoration(
//                             hintText: "Address",
//                             contentPadding: EdgeInsets.all(5),
//                             hintStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             )),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Color.fromARGB(255, 45, 44, 44),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         controller: funprovider.agentcontactnumber,
//                         decoration: InputDecoration(
//                             hintText: "  Contact Number",
//                             contentPadding: EdgeInsets.all(5),
//                             hintStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             )),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Color.fromARGB(255, 45, 44, 44),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         controller: funprovider.agentrgstate,
//                         decoration: InputDecoration(
//                             hintText: "  State",
//                             contentPadding: EdgeInsets.all(5),
//                             hintStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Color.fromARGB(255, 45, 44, 44),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         controller: funprovider.agentrgcity,
//                         decoration: InputDecoration(
//                             hintText: "City",
//                             contentPadding: EdgeInsets.all(5),
//                             hintStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Color.fromARGB(255, 45, 44, 44),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         controller: funprovider.agentrgemail,
//                         decoration: InputDecoration(
//                             hintText: "Email",
//                             contentPadding: EdgeInsets.all(5),
//                             hintStyle: TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 18,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.white),
//                           color: Color.fromARGB(255, 45, 44, 44),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: TextFormField(
//                         controller: funprovider.agentrgpassword,
//                         decoration: InputDecoration(
//                             hintText: "Password",
//                             contentPadding: EdgeInsets.all(5),
//                             hintStyle: const TextStyle(color: Colors.white),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10))),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     SizedBox(
//                       height: 40,
//                       width: 130,
//                       child:
//                           // islosding
//                           // ? Center(
//                           //     child: CircularProgressIndicator(),
//                           //   )
//                           // :
//                           OutlinedButton(
//                               style: OutlinedButton.styleFrom(
//                                   backgroundColor: Colors.blue[400],
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(10))),
//                               onPressed: () {
//                                 AgenteService agenteService = AgenteService();
//                                 agenteService.addAgent(
//                                     AgentModel(
//                                         agencyname: funprovider.agencyname.text,
//                                         agentaddress:
//                                             funprovider.agentrgaddress.text,
//                                         agentcity: funprovider.agentrgcity.text,
//                                         agentemail:
//                                             funprovider.agentrgemail.text,
//                                         agentstate:
//                                             funprovider.agentrgstate.text,
//                                         contactnumber:
//                                             funprovider.agentcontactnumber.text,
//                                         image: funprovider.imageurl,
//                                         password:
//                                             funprovider.agentrgpassword.text),
//                                     FirebaseAuth.instance.currentUser!.uid);
//                               },
//                               child: Text(
//                                 "Register Now",
//                                 style:
//                                     GoogleFonts.amaranth(color: Colors.black),
//                               )),
//                     ),
//                   ]),
//             ),
//           ),
//         ),
//       ],
//     ));
//   }
// }
