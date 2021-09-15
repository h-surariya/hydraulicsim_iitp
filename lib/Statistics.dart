
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:hydraulicsim_iitp/models/attributepassc2.dart';

class Statistics extends StatefulWidget {
  static String id='Statistics_Screen';
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {

  @override
  Widget build(BuildContext context) {
    Attributepassc2 attributes=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black12,),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 35,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Image.asset('ImageAssets/piston.png')),
                                  ),
                                  Text("Piston",
                                    style: TextStyle(
                                        fontSize: 28  ,
                                        fontWeight: FontWeight.bold
                                    ),),
                                ],
                              ),
                              SizedBox(
                                height: 15  ,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                Text("Force (kN) : ",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),),
                                  Text(attributes.forceonpiston.toStringAsFixed(5),
                                  style: TextStyle(
                                    fontSize: 22
                                  ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Velocity (cm/s) : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.velopiston.toStringAsFixed(5),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Bore Dia (cm) : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.boredia.toString(),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Stroke (cm) : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.stroke.toStringAsFixed(5),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 35,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Image.asset('ImageAssets/pumpmotr.png')),
                                  ),
                                  Text("Pump",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold
                                    ),),
                                ],
                              ),
                              SizedBox(
                                height: 15  ,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Turning Torque : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.turningtorq.toStringAsFixed(5),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Disp Vol (cm^3) : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.displvol.toStringAsFixed(5),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("RPM : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.rpm.toStringAsFixed(5),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Power (W) : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.powerrate.toStringAsFixed(5),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blue,
                                    radius: 35,
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Image.asset('ImageAssets/line.png')),
                                  ),
                                  Text("Other Parameters",
                                    style: TextStyle(
                                        fontSize: 28  ,
                                        fontWeight: FontWeight.bold
                                    ),),
                                ],
                              ),
                              SizedBox(
                                height: 15  ,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Flow Rate (m^3/s) : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.flowrate.toStringAsFixed(5),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Pressure (Pa) : ",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text(attributes.pressureout.toStringAsFixed(5),
                                    style: TextStyle(
                                        fontSize: 22
                                    ),),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
