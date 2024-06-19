import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/viewmodel/user_report_service.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report List'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<UserReportService>(
              builder: (context, instance, child) {
                return FutureBuilder(
                  future: instance.getreport(),
                  builder: (context, snapshot) {
                    final data = instance.rprot;
                    return data.isEmpty? Center(child: Text('No report '),): ListView.separated(
                      itemCount: data.length,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            // CircleAvatar(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(data[index].reportManagerissues.toString()),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                        );
                      },
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:secure_kare/viewmodel/user_report_service.dart';
// import 'package:secure_kare/view/user/screen_user_home.dart';

// class ReportView extends StatelessWidget {
//   const ReportView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final reportService = Provider.of<UserReportService>(context);
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 247, 255, 222),
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) {
//                 return const ScreenUserHome();
//               },
//             ));
//           },
//           icon: const Icon(
//             Icons.keyboard_arrow_left_outlined,
//             color: Colors.black,
//           ),
//         ),
//         backgroundColor: const Color.fromARGB(255, 247, 255, 222),
//         title: Text(
//           "Report List",
//           style: GoogleFonts.content(color: Colors.black),
//         ),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: FutureBuilder(
//         future: reportService.getreport(),
//         builder: (context, snapshot) {
//           final data = reportService.rprot;
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (data.isEmpty) {
//             return const Center(child: Text('No report'));
//           }
//           return ListView.separated(
//             itemCount: data.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(data[index].reportManagerissues.toString(),
//                     style: GoogleFonts.bellota()),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return const Divider(
//                 thickness: 1,
//                 endIndent: 20,
//                 indent: 20,
//                 color: Color.fromARGB(255, 114, 107, 107),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
