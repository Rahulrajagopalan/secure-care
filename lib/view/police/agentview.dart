import 'package:flutter/material.dart';
import 'package:secure_kare/model/agentmodel.dart';

class Agentview extends StatelessWidget {
  final AgentModel agentModel;
  Agentview({super.key, required this.agentModel});

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
                      child: Image.network(agentModel.image!),
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
                      'MANAGER NAME: ${agentModel.agencyname}',
                      style: TextStyle(
                        fontSize: width * .05,
                      ),
                    ),
                    SizedBox(
                      height: height * .020,
                    ),
                    Text(
                      ' MAIL: ${agentModel.agentemail}',
                      style: TextStyle(
                        fontSize: width * .05,
                      ),
                    ),
                    SizedBox(
                      height: height * .020,
                    ),
                    Text(
                      ' PLACE : ${agentModel.agentstate}',
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
