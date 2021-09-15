import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydraulicsim_iitp/Graph_single_cylinder.dart';
import 'package:hydraulicsim_iitp/Statistics.dart';
import 'package:hydraulicsim_iitp/models/attributepassc2.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';
import 'package:hydraulicsim_iitp/Attribute.dart';
import 'package:rive/rive.dart';
import 'SimulationScreen_test2.dart';
import 'SimulationScreen_test1.dart';
import 'Attribute.dart';
import 'package:hydraulicsim_iitp/Graph_double_cylinder.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';

class simulationscreentest1 extends StatefulWidget {
  static String id='Simulation_Screen_test1';

  @override
  _simulationscreentest1State createState() => _simulationscreentest1State();
}

class _simulationscreentest1State extends State<simulationscreentest1> {
  Artboard _riveArtboard_pipeframe,_riveArtboard_valve,_riveArtboard_dbpiston;
  RiveAnimationController _controller_pipeframe,_controller_valve,_controller_dbpiston;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String piston_selection="";
  int state_dcvalve=0;

  List<List<int>> LogicArr = [
    [3,2,115,1],
    [4,1,183,2],
  ];
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    rootBundle.load('Animations/double_acting_cylinderfinal.riv').then(
          (data) async {
        final file = RiveFile();
        piston_selection="Double Acting Cylinder";
        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_dbpiston = SimpleAnimation('Static'));
          setState(() => _riveArtboard_dbpiston = artboard);
        }
      },
    );
    rootBundle.load('Animations/double_acting_frame.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_pipeframe = SimpleAnimation('Static'));
          setState(() => _riveArtboard_pipeframe = artboard);
        }
      },
    );
    rootBundle.load('Animations/4_2_dc_valve.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_valve = SimpleAnimation('Static'));
          setState(() =>_riveArtboard_valve = artboard);
        }
      },
    );
    rootBundle.load('Animations/double_acting_cylinder.riv').then(
          (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller_dbpiston = SimpleAnimation('Static'));
          setState(() =>_riveArtboard_dbpiston = artboard);
        }
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Attributepasssc1 attributes=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 645,
                    child: DoubleActingFrame(LogicArr[state_dcvalve][3]),
                ),
                Positioned(
                  top: 180,
                  left:LogicArr[state_dcvalve][2].toDouble(),
                  child: Container(
                    height: 79,
                    width: 200,
                    child: Stack(children: [
                      Valve(LogicArr[state_dcvalve][1]),
                      Positioned(
                        bottom:10,
                        left: 9,
                        child: GestureDetector(
                          onTap: (){
                            print("change");
                            setState(() {
                              if(state_dcvalve==0){
                                state_dcvalve=1;
                              }else{
                                state_dcvalve=0;
                              }
                            });
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      )
                    ],),
                  ),
                ),
                Positioned(
                  top: 25,
                  left:13,
                  child: Container(
                    height: 70,
                    width: 400,
                    child: DBPiston(LogicArr[state_dcvalve][0]),
                  ),
                ),
                Positioned(
                  top: 30,
                  right:15,
                  child: GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                        backgroundColor: Colors.purple,
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0)),
                          ),
                          builder: (BuildContext context){
                            return(
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Select the type of Piston",
                                  style:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                  )),
                                ),
                                DropdownButton<String>(
                                  value: piston_selection,
                                  iconSize: 10,
                                  elevation: 16,
                                  style: TextStyle(color: Colors.deepPurple),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      piston_selection=newValue;
                                      if(piston_selection=="Single Acting Cylinder"){
                                        setState(() {
                                          Navigator.pushNamed(context, simulationScreen_test2.id,arguments: Attributepasssc1(rpm:attributes.rpm,powerrate:attributes.powerrate,displvol: attributes.displvol,boredia:attributes.boredia,stroke: attributes.stroke,pressureset:attributes.pressureset,turningtorq:attributes.turningtorq,flowrate:attributes.flowrate,pressureout: attributes.pressureout,areapiston: attributes.areapiston,forceonpiston: attributes.forceonpiston,velopiston: attributes.velopiston,springconstant:attributes.springconstant,viscosity:attributes.viscosity,piston_mass: attributes.piston_mass,pressure_diff:attributes.pressure_diff));
                                        });

                                      }
                                      else{
                                        Navigator.pop(context);
                                      }

                                    });
                                  },
                                  items: <String>['Double Acting Cylinder','Single Acting Cylinder']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value,
                                        style: TextStyle(
                                            color: Colors.black ,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600
                                        ),),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ));

                      });
                    },
                    child: Icon(Icons.arrow_drop_down_circle,
                    color: Colors.white,
                    size: 40,),
                  ),
                )

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:18.0),
                  child: RoundedButtonSmall(title:"Parameters",colour:Colors.blue,onPressed: (){
                    //GOTO Stats page
                    Navigator.pushNamed(context, Statistics.id,arguments: Attributepassc2(rpm: attributes.rpm,powerrate: attributes.powerrate,displvol: attributes.displvol,boredia: attributes.boredia,stroke: attributes.stroke,pressureset: attributes.pressureset,turningtorq: attributes.turningtorq,flowrate: attributes.flowrate,pressureout: attributes.pressureout,areapiston: attributes.areapiston,forceonpiston: attributes.forceonpiston,velopiston: attributes.velopiston));
                  },),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:18.0),
                  child: RoundedButtonSmall(title:"Graphs",colour:Colors.blue,onPressed: (){
                    //GOTO Stats page
                    Navigator.pushNamed(context, Graph_single_cylinder.id,arguments: Attributepassc2(rpm: attributes.rpm,powerrate: attributes.powerrate,displvol: attributes.displvol,boredia: attributes.boredia,stroke: attributes.stroke,pressureset: attributes.pressureset,turningtorq: attributes.turningtorq,flowrate: attributes.flowrate,pressureout: attributes.pressureout,areapiston: attributes.areapiston,forceonpiston: attributes.forceonpiston,velopiston: attributes.velopiston,springconstant: attributes.springconstant,piston_mass: attributes.piston_mass,viscosity: attributes.viscosity,pressure_diff: attributes.pressure_diff));
                  },),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:18.0),
              child: RoundedButtonSmall(title:"Change Values",colour:Colors.red,onPressed: (){
                //GOTO Stats page
                Navigator.pushNamed(context, Attribute.id,arguments: Attributepassc2(rpm: attributes.rpm,powerrate: attributes.powerrate,displvol: attributes.displvol,boredia: attributes.boredia,stroke: attributes.stroke,pressureset: attributes.pressureset,turningtorq: attributes.turningtorq,flowrate: attributes.flowrate,pressureout: attributes.pressureout,areapiston: attributes.areapiston,forceonpiston: attributes.forceonpiston,velopiston: attributes.velopiston));
              },),
            ),
          ],
        ),
      ),
    );
  }
  Widget DoubleActingFrame(state) {
    if (_riveArtboard_pipeframe != null) {
      switch (state) {
        case 1:
          _riveArtboard_pipeframe.artboard..addController(SimpleAnimation('FORWARD'));
          break;
        case 2:
          _riveArtboard_pipeframe.artboard..addController(SimpleAnimation('BACKWARD'));
          break;
        case 3:
          _riveArtboard_pipeframe.artboard..addController(SimpleAnimation('Static'));
          break;
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Rive(
          artboard: _riveArtboard_pipeframe,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
  Widget Valve(state) {
    if (_riveArtboard_valve != null) {
      switch (state) {
        case 1:
          _riveArtboard_valve.artboard..addController(SimpleAnimation('static'));
          break;
        case 2:
          _riveArtboard_valve.artboard..addController(SimpleAnimation('Switch'));
          break;
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Rive(
          artboard: _riveArtboard_valve,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
  Widget DBPiston(state) {
    if (_riveArtboard_dbpiston != null) {
      switch (state) {
        case 1:
          _riveArtboard_dbpiston.artboard..addController(SimpleAnimation('Backward-static'));
          break;
        case 2:
          _riveArtboard_dbpiston.artboard..addController(SimpleAnimation('Forward-static'));
          break;
        case 3:
          _riveArtboard_dbpiston.artboard..addController(SimpleAnimation('Forward'));
          break;
        case 4:
          _riveArtboard_dbpiston.artboard..addController(SimpleAnimation('Backward'));
          break;
      }
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Rive(
          artboard: _riveArtboard_dbpiston,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}
