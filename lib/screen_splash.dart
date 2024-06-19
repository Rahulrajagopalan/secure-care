import 'package:flutter/material.dart';
import 'package:secure_kare/view/agent/screen_agent_login.dart';
import 'package:secure_kare/view/manager/screen_manager_login.dart';
import 'package:secure_kare/view/police/policeloggin.dart';
import 'package:secure_kare/view/police/screen_camw.dart';
import 'package:secure_kare/view/user/screen_user_loginupadate.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    final wdth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customebutton(wdth, context, "WORKER", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenUserLogin(),
              ));
            }),
            const SizedBox(
              height: 10,
            ),
            // customebutton(wdth, context, "ADMIN", () {
            //   Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => ScreenAdminLogin(),
            //   ));
            // }),
            // const SizedBox(
            //   height: 10,
            // ),
            customebutton(wdth, context, "AGENT", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenAgentLogin(),
              ));
            }),
            const SizedBox(
              height: 10,
            ),
            customebutton(wdth, context, "MANAGER", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenManagerLogin(),
              ));
            }),
            const SizedBox(
              height: 10,
            ),
            customebutton(wdth, context, "POLICE", () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PoliceLoggin(),
              ));
            }),
          ],
        ),
      )),
    );
  }

  customebutton(wdth, context, title, void Function()? onPressed) {
    return SizedBox(
      width: wdth * .7,
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              // backgroundColor: Colors,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          )),
    );
  }
}
