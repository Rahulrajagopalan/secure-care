import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/admin/screen_admin_profile.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';

class CustomeDrawer extends StatelessWidget {
  const CustomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
   
    Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Signout event'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure logout'),
              
            ],
          ),
        ),
        actions: <Widget>[
          Consumer<AdminController>(builder: (context, intance, child) {
            return TextButton(
            child: const Text('yes'),
            onPressed: () async{
              await   intance.logout(context);
            },
          );
          },),
          TextButton(
            child: const Text('no'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
    final controller = Provider.of<AdminController>(context, listen: false);
    return Container(
      width: 550,
      // height: 800,
      color: Color.fromARGB(255, 234, 229, 229),
      child: Padding(
        padding: const EdgeInsets.only(right: 260),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 130,
              height: 130,
              child: CircleAvatar(
                  backgroundImage: AssetImage(
                "assets/abb.webp",
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Admin-SECURE KARE",
              style:
                  GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              height: 10,
            ),
            // SizedBox(
            //   height: 25,
            //   width: 130,
            //   child: OutlinedButton(
            //       style: OutlinedButton.styleFrom(
            //           elevation: 10, backgroundColor: Colors.white),
            //       onPressed: () {
            //         // controller.changeIndex(0);
            //         Navigator.pushReplacement(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => const ScreenAdminProfile(),
            //             ));
            //       },
            //       child: Text(
            //         "Update profile",
            //         style: GoogleFonts.outfit(color: Colors.black),
            //       )),
            // ),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  controller.changeIndex(0);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => RegisterEmployee(),
                  //     ));
                },
                child: Text(
                  "Register an Agency",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  controller.changeIndex(1);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ScreenAdminVerification(),
                  //     ));
                },
                child: Text(
                  "Verifications",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  controller.changeIndex(2);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ScreenFeedbackReports(),
                  //     ));
                },
                child: Text(
                  "Feedbacks and reports ",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            TextButton(
                onPressed: () {
                  controller.changeIndex(3);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => ScreenHumanResouceManagement(),
                  //     ));
                },
                child: Text(
                  "Human Resouse Management",
                  style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 15,
            ),
            // TextButton(
            //     onPressed: () {
            //       controller.changeIndex(4);
            //       // Navigator.pushReplacement(
            //       //     context,
            //       //     MaterialPageRoute(
            //       //         builder: (context) => ScreenAdminNotifications()));
            //     },
            //     child: Text(
            //       "Notifications",
            //       style: GoogleFonts.outfit(fontSize: 18, color: Colors.black),
            //     ))
            SizedBox(
              height: MediaQuery.of(context).size.height*.060,
            ),
              GestureDetector(
                onTap: () async{
               
               await _showMyDialog();

                },
                child: 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                      Text('Logout'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
