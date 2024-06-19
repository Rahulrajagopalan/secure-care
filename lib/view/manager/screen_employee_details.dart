import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:secure_kare/view/manager/screen_project_details.dart';
import 'package:secure_kare/viewmodel/ui_work_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScreenEmployeeDetails extends StatelessWidget {
  const ScreenEmployeeDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final workprovider = Provider.of<WorkProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return ScreenProjectDetails();
                },
              ));
            },
            icon: const Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Employee Details",
          style: GoogleFonts.amaranth(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.question_mark,
                color: Colors.black,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage(workprovider.debruyne),
            ),
          ),
          Text(
            "John Hernandez",
            style:
                GoogleFonts.amaranth(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Icon(
            Icons.location_on,
            color: Colors.red,
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 68, 76, 118),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Attendance",
                style: GoogleFonts.nunitoSans(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          new CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: 1.0,
            center: new Text("74%"),
            progressColor: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 120,
            height: 40,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 156, 28, 19),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Perfomance",
                style: GoogleFonts.nunitoSans(color: Colors.white),
              ),
            ),
          ),
          new CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: 1.0,
            center: new Text("89%"),
            progressColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
