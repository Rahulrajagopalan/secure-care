import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/admin/admin_feedback.dart';
import 'package:secure_kare/view/admin/admin_h_r_m.dart';
import 'package:secure_kare/view/admin/admin_notification.dart';
import 'package:secure_kare/view/admin/admin_reg_employee.dart';
import 'package:secure_kare/view/admin/admin_verification.dart';
import 'package:secure_kare/view/admin/pending_verification.dart';
import 'package:secure_kare/view/admin/register_employee.dart';
import 'package:secure_kare/view/admin/screen_register.dart';
import 'package:secure_kare/view/admin/verified_registrations.dart';
import 'package:secure_kare/view/admin/widgets/drawer.dart';
import 'package:secure_kare/viewmodel/admin_controller.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  List<Widget> pages = [
    ScreenRegister(),
    const AdminVerification(),
    const AdminFeedBackAndSupport(),
    const AdminHRM(),
    // AdminNotification(),
    const ScreenPendingVerifications(),
    const ScreenVerifiedRegisstrations()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          
          const CustomeDrawer(),
          Consumer<AdminController>(builder: (context, controller, child) {
            return Expanded(child: pages[controller.selectedIndex]);
          }),
         
        ],
      ),
    );
  }
}
