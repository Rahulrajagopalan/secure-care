import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/admin/screen_register.dart';
import 'package:secure_kare/view/user/screen_user_home.dart';
import 'package:secure_kare/viewmodel/function_provider.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenUserLogin extends StatelessWidget {
  const ScreenUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    final funprovider = Provider.of<FunProvider>(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 180,),
                  Image.asset("assets/loginphoto.jpeg"),
                  Text(
                    "Login To Your Account",
                    style: GoogleFonts.sarabun(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: funprovider.workerlogemail,
                    decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: GoogleFonts.sarabun(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                 
                  // password
                  Consumer<WorkProvider>(builder: (context, workprvdr, child) {
                    return TextField(
                    obscureText: workprovider.isobsucure,
                    
                    controller: funprovider.workerlogpassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: ()
                        {
                          workprovider.togle();
                        },
                        icon: Icon (workprovider.isobsucure ?  Icons.visibility_off : Icons.visibility),
                      ),
                        hintText: "Password",
                        hintStyle: GoogleFonts.sarabun(),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  );
                  },),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        funprovider.signin(context);
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      )),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     const Text(
                  //       "Dont have an account ?",
                  //       style: TextStyle(fontSize: 18),
                  //     ),
                  //     TextButton(
                  //         onPressed: () {
                  //           Navigator.of(context).push(MaterialPageRoute(
                  //               builder: (context) => ScreenRegister()));
                  //         },
                  //         child: const Text(
                  //           "Create",
                  //           style:  TextStyle(fontSize: 18),
                  //         ))
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
