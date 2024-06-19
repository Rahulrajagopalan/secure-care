// import 'package:flutter/material.dart';
// import 'package:secure_kare/view/admin/verified_registrations.dart';
// import 'package:secure_kare/viewmodel/function_provider.dart';

// class RegisterEmployee extends StatelessWidget {
//   RegisterEmployee({super.key});
//   final agencyname = TextEditingController();
//   final agentcontactnumber = TextEditingController();
//   final agentrgstate = TextEditingController();
//   final agentrgaddress = TextEditingController();
//   final agentrgcity = TextEditingController();
//   final agentrgemail = TextEditingController();
//   final policeloginemail = TextEditingController();
//   final policeloginpassword = TextEditingController();
//   final agentcompanyname = TextEditingController();
//   final agentrgpassword = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text("agencyname"),
//           TextField(
//             controller: agencyname,
//           ),
//           Text("address"),
//           TextField(
//             controller: agentrgaddress,
//           ),
//           Text("contactnumber"),
//           TextField(
//             controller: agentcontactnumber,
//           ),
//           Text("State"),
//           TextField(
//             controller: agentrgstate,
//           ),
//           Text("city"),
//           TextField(
//             controller: agentrgcity,
//           ),
//           Text("email"),
//           TextField(
//             controller: agentrgemail,
//           ),
//           Text("password"),
//           TextField(
//             controller: agentrgpassword,
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           ElevatedButton(
//               onPressed: () {
//                 FunProvider().signupwithAgent(context).then(
//                   (value) {
//                     FunProvider().sendEmail(
//                         FunProvider().agentrgpassword.text,
//                         ('Work force kerela Login Password is:${FunProvider().agentrgpassword.text}'),
//                         FunProvider().agentrgemail.text);
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //   builder: (context) {
//                     //     return ScreenVerifiedRegisstrations();
//                     // },
//                     // ));
//                   },
//                 );
//               },
//               child: Text("Register"))
//         ],
//       ),
//     );
//   }
// }
