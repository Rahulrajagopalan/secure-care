import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/managerdetails.dart';
import 'package:secure_kare/view/police/screen_camw.dart';
import 'package:secure_kare/viewmodel/policecontroll.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenManagers extends StatelessWidget {
  ScreenManagers({super.key});
  final CollectionReference manager =
      FirebaseFirestore.instance.collection("MANAGER");

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context, listen: false);
    final policeprovider = Provider.of<PoliceControler>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              // Navigator.of(context).pushReplacement(MaterialPageRoute(
              //   builder: (context) {
              //     return ScreenCompamw();
              //   },
              // ));
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Managers",
          style: GoogleFonts.merriweather(
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
        stream: policeprovider.getManeger().asStream(),
        builder: (context, snapshot) {
          final data = policeprovider.maneger;
          return ListView.separated(
            itemCount: data.length,
            itemBuilder: (context, index) {
              // final DocumentSnapshot managersnap = snapshot.data!.docs[index];
              return ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage(data[index].managerimage.toString()),
                ),
                title: Text(
                  data[index].managername.toString(),
                  style: GoogleFonts.barlow(),
                ),
                trailing: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ManagerDeatailsView(managerModel: data[index]),
                      )),
                  child: Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'View',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 20,
              );
            },
          );
        },
      ),
    );
  }
}
