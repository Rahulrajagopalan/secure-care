import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:secure_kare/model/managermodel.dart';
import 'package:secure_kare/model/workersmodel.dart';

class Workerview extends StatelessWidget {
  final WorkersModel managerModel;
  Workerview({super.key, required this.managerModel});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * .050,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * .020,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * .50,
                      height: height * .20,
                      // color: Colors.red,
                      child:
                          Image.network('managerModel.managerimage.toString()'),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .050,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MANAGER NAME: }',
                      style: TextStyle(
                        fontSize: width * .05,
                      ),
                    ),
                    SizedBox(
                      height: height * .020,
                    ),
                    Text(
                      ' MAIL:',
                      style: TextStyle(
                        fontSize: width * .05,
                      ),
                    ),
                    SizedBox(
                      height: height * .020,
                    ),
                    Text(
                      ' PLACE : ',
                      style: TextStyle(
                        fontSize: width * .05,
                      ),
                    ),
                    SizedBox(
                      height: height * .020,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
