// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class AdminNotification extends StatelessWidget {
//   const AdminNotification({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemBuilder: (context, index) {
//         return SizedBox(
//           height: 70,
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundImage: AssetImage("assets/kanew.jpg"),
//             ),
//             title: Row(
//               children: [
//                 Text(
//                   "Rohit kumar ",
//                   style: GoogleFonts.amaranth(fontWeight: FontWeight.w600),
//                 ),
//                 Text(
//                   " is registered as an ",
//                   style: GoogleFonts.yanoneKaffeesatz(),
//                 ),
//                 Text(
//                   " Manager",
//                   style: GoogleFonts.amaranth(fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(
//                   width: 100,
//                 ),
//                 Text(
//                   "4 ",
//                   style: GoogleFonts.cantarell(
//                       fontSize: 12, color: Color.fromARGB(255, 143, 142, 142)),
//                 ),
//                 Text("minutes ago",
//                     style: GoogleFonts.cantarell(
//                         fontSize: 12,
//                         color: Color.fromARGB(255, 143, 142, 142)))
//               ],
//             ),
//             trailing: SizedBox(
//               width: 230,
//               child: Row(
//                 children: [
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           backgroundColor: Color.fromARGB(255, 17, 58, 19)),
//                       onPressed: () {},
//                       child: Text(
//                         "Approve",
//                         style: GoogleFonts.amaranth(),
//                       )),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                           backgroundColor: Color.fromARGB(255, 232, 39, 25)),
//                       onPressed: () {},
//                       child: Text(
//                         "Reject",
//                         style: GoogleFonts.amaranth(),
//                       ))
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
