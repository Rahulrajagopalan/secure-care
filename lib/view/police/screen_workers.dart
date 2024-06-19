import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/police/screen_camw.dart';
import 'package:secure_kare/viewmodel/policecontroll.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';

class ScreenWorkers extends StatelessWidget {
  ScreenWorkers({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<PoliceControler>(context, listen: false);
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
          "Workers",
          style: GoogleFonts.quicksand(
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
        stream: workprovider.acceptedworkers().asStream(),
        builder: (context, snapshot) {
          final data = workprovider.worker;
          return data.isEmpty
              ? Center(
                  child: TextButton(
                    child: Text('no worker'),
                    onPressed: () {
                      workprovider.acceptedworkers().asStream();
                      // log(data[index].agencyId);
                    },
                  ),
                )
              : ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index].workerimage!),
                      ),
                      title: Text(data[index].workersname!,
                          style: GoogleFonts.alata()),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 50,
                    );
                  },
                );
        },
      ),
    );
  }
}
