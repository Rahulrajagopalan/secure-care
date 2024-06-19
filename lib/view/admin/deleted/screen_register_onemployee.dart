// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:secure_kare/view/admin/screen_verified_registrations.dart';
// import 'package:secure_kare/viewmodel/function_provider.dart';

// class ScreenRegisterOn extends StatelessWidget {
//   const ScreenRegisterOn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final funprovider = Provider.of<FunProvider>(context);
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("agencyname"),
//               TextField(
//                 controller: funprovider.agencyname,
//               ),
//               Text("address"),
//               TextField(
//                 controller: funprovider.agentrgaddress,
//               ),
//               Text("contactnumber"),
//               TextField(
//                 controller: funprovider.agentcontactnumber,
//               ),
//               Text("State"),
//               TextField(
//                 controller: funprovider.agentrgstate,
//               ),
//               Text("city"),
//               TextField(
//                 controller: funprovider.agentrgcity,
//               ),
//               Text("email"),
//               TextField(
//                 controller: funprovider.agentrgemail,
//               ),
//               Text("password"),
//               TextField(
//                 controller: funprovider.agentrgpassword,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     funprovider.signupwithAgent(context).then(
//                       (value) {
//                         funprovider.sendEmail(
//                             funprovider.agentrgpassword.text,
//                             ('Work force kerela Login Password is:${funprovider.agentrgpassword.text}'),
//                             funprovider.agentrgemail.text);
//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) {
//                             return ScreenVerifiedRegisstrations();
//                           },
//                         ));
//                       },
//                     );
//                   },
//                   child: Text("Register"))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
