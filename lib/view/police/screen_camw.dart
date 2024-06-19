import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/screen_agencies.dart';
import 'package:secure_kare/view/police/screen_complaints.dart';
import 'package:secure_kare/view/police/screen_managers.dart';
import 'package:secure_kare/view/police/screen_workers.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenCompamw extends StatelessWidget {
  const ScreenCompamw({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: workprovider.policehomedrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Work force kerela",
          style: GoogleFonts.overpass(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ));
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ScreenComplaints(),
                ));
              },
              child: Container(
                width: 170,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 2)],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.phone_android,
                      size: 45,
                    ),
                    Text(
                      "Complaints",
                      style: GoogleFonts.signikaNegative(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenAgencies(),
                      ));
                    },
                    child: Container(
                      width: 110,
                      height: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 2)],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_home_work,
                            size: 45,
                          ),
                          Text(
                            "Agencies",
                            style: GoogleFonts.signikaNegative(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenManagers(),
                      ));
                    },
                    child: Container(
                      width: 110,
                      height: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 2)],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.supervised_user_circle,
                            size: 45,
                          ),
                          Text(
                            "Managers",
                            style: GoogleFonts.signikaNegative(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenWorkers(),
                      ));
                    },
                    child: Container(
                      width: 110,
                      height: 130,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(blurRadius: 2)],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.supervisor_account,
                            size: 45,
                          ),
                          Text(
                            "Workers",
                            style: GoogleFonts.signikaNegative(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
