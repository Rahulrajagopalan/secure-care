// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
// import 'package:secure_kare/model/usermodel.dart';
// import 'package:secure_kare/model/workersmodel.dart';
// import 'package:secure_kare/view/user/screen_personalinfo.dart';
// import 'package:secure_kare/viewmodel/admin_controller.dart';
// import 'package:secure_kare/viewmodel/function_provider.dart';

// import '../../viewmodel/user_store.dart';

// class ScreenOtp extends StatelessWidget {
//   UserModel usermodel;
//   String password;
//   ScreenOtp({super.key, required this.usermodel,required this.password});
//   final firestore = FirestoreService();
//   final _formKey = GlobalKey<FormState>();
//   final otpController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Form(
//               key: _formKey,
//               child: Container(
//                 decoration: const BoxDecoration(color: Colors.white),
//                 child: TextFormField(
//                   controller: otpController,
//                   validator: (value) {
//                     if (value!.isNotEmpty) {
//                       return null;
//                     } else {
//                       return "Enter the Otp";
//                     }
//                   },
//                   decoration: InputDecoration(
//                       contentPadding:
//                           const EdgeInsets.only(left: 30, right: 30, top: 30),
//                       hintText: "OTP",
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     AdminController()
//                         .verifyOTP(context, otpController.text, usermodel,password);
//                     // Navigator.of(context).pushReplacement(MaterialPageRoute(
//                     //   builder: (context) => ScreenUserPersonalInfo(),
//                     // ));
//                   }
//                   //   funprovider.verifyOTP(context);
//                 },
//                 child: Text("Verify")),
//           ],
//         ),
      
//     );
//   }
// }
