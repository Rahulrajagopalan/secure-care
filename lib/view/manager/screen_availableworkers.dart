import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:secure_kare/view/manager/screen_home_manager.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenAgentAvailableWorkers extends StatelessWidget {
  ScreenAgentAvailableWorkers({super.key});
  final CollectionReference workers =
      FirebaseFirestore.instance.collection("ACCEPTED WORKERS");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 254, 254),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return ScreenHomeManager();
                  },
                ));
              },
              icon: const Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.black,
              )),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 251, 251),
          title: Text(
            "Work force kerala",
            style: GoogleFonts.nunitoSans(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.error,
                  color: Colors.black,
                ))
          ],
        ),
        body: StreamBuilder(
            stream: workers.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(workprovider.mc),
                    ),
                    title: Text(
                      "MC HOUSE BUILDING",
                      style: GoogleFonts.andika(),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 30,
                          width: 88,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              onPressed: () {},
                              child: Text("SelectAll",
                                  style: GoogleFonts.amaranth(
                                    color: Colors.black,
                                  )))),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 500,
                      height: 600,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [BoxShadow(blurRadius: 1)],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Available Workers",
                            style: GoogleFonts.amaranth(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final DocumentSnapshot workerssnap =
                                    snapshot.data!.docs[index];
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        AssetImage(workprovider.debruyne),
                                  ),
                                  title: Text(workerssnap["workersname"],
                                      style: GoogleFonts.alata()),
                                  subtitle: Text("Construction worker"),
                                  trailing: SizedBox(
                                    width: 110,
                                    child: Row(children: [
                                      SizedBox(
                                        height: 30,
                                        child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 37, 49, 117)),
                                            onPressed: () {
                                              workprovider.workassigndropdown(
                                                  context, workerssnap);
                                            },
                                            child: Text(
                                              "Assign",
                                              style: GoogleFonts.amaranth(
                                                  color: Colors.white),
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      workprovider.isselected
                                          ? RoundCheckBox(
                                              size: 20,
                                              onTap: (p0) {},
                                            )
                                          : const SizedBox()
                                    ]),
                                  ),
                                );
                              },
                              itemCount: snapshot.data!.docs.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]);
              } else {
                return Container();
              }
            }));
  }
}
