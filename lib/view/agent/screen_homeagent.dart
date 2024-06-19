import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/screen_splash.dart';
import 'package:secure_kare/view/agent/screen_aboutusagent.dart';
import 'package:secure_kare/view/agent/screen_add_manager.dart';
import 'package:secure_kare/view/agent/screen_add_project.dart';
import 'package:secure_kare/view/agent/screen_add_workers.dart';
import 'package:secure_kare/view/agent/screen_agent_profile.dart';
import 'package:secure_kare/view/agent/screen_availablemanagers.dart';
import 'package:secure_kare/view/agent/screen_notificationagent.dart';
import 'package:secure_kare/view/agent/screen_ongoingprojectagent.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenHomeAgent extends StatefulWidget {
  const ScreenHomeAgent({super.key});

  @override
  State<ScreenHomeAgent> createState() => _ScreenHomeAgentState();
}

class _ScreenHomeAgentState extends State<ScreenHomeAgent> {
  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      drawer: const Padding(
          padding: EdgeInsets.only(top: 90, bottom: 200, right: 170),
          child: AgentDrawer()),
      backgroundColor: const Color.fromARGB(255, 206, 225, 204),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 206, 225, 204),
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
        title: Text(
          "Work force kerela",
          style: GoogleFonts.nunitoSans(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(workprovider.construction1)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 500),
            child: Container(
              height: 200,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    workprovider.construction2,
                    fit: BoxFit.fitHeight,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 300),
            child: Container(
              height: 180,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    workprovider.construction3,
                    fit: BoxFit.fitHeight,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 210, top: 300),
            child: Container(
              height: 400,
              width: 170,
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    workprovider.construction4,
                    fit: BoxFit.fitHeight,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class AgentDrawer extends StatelessWidget {
  const AgentDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      backgroundColor: const Color.fromARGB(255, 9, 17, 61),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, bottom: 3, top: 60),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenAgentProfile(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Profile",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScreenAgentAddProject(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Add Projects",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenAgentAvailableManagers(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Managers",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenOngoingProjectAgent(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Ongoing projects",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const ScreenNotificationAgent();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Notifcation",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenAddWorker()));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Add Workers",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenAddManager(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "Add managers",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScreenAgentAboutUs(),
                    ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "About",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            // Row(
            //   children: [
            //     const SizedBox(
            //       width: 50,
            //     ),
            //     const Icon(
            //       Icons.arrow_right,
            //       color: Colors.white,
            //     ),
            //     TextButton(
            //         onPressed: () {},
            //         child: Text(
            //           "Logout",
            //           style:
            //               GoogleFonts.corben(color: Colors.white, fontSize: 12),
            //         ))
            //   ],
            // )
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut().then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenSplash(),
                        ),
                      );
                    });

                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const ScreenAgentAboutUs(),
                    // ));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                      Text(
                        "logout",
                        style: GoogleFonts.corben(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
