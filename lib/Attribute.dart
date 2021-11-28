import 'dart:math';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydraulicsim_iitp/SimulationScreen_test2.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';
import 'SimulationScreen_test1.dart';
import 'package:hydraulicsim_iitp/componentes/reusable_card.dart';
import 'dynamic_page.dart';

class Attribute extends StatefulWidget {
  static String id = 'Attribute_Screen';
  @override
  _AttributeState createState() => _AttributeState();
}

class _AttributeState extends State<Attribute> {
  double rpm,
      Powerating,
      Boredia,
      stroke,
      pressure,
      dispvol,
      springconstant = 10,
      piston_mass,
      piston_rod_dia,
      fluid_density,
      pipe_length,
      pipe_dia,
      fluid_viscosity,
      pipe_roughness;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text('HYDRAULIC SIMULATOR',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8D8E98),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hydraulics",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Hydraulics is confined liquids under pressure made to do work or Science of transmitting force motion through a medium of confined liquid. By hydraulics, we mean the generation of forces and motion using hydraulic fluids. The hydraulic fluids represent the medium for power transmission. The objective of this project is to learn all the types of hydraulics and its applications in main areas and eventually to design an app or a webpage to perform its simulation of different circuits (similar to any lab requiring a hydraulic) and to determine the output. The applications of these can be very vast as the places which require particular hydraulics circuits can test all possible conditions virtually instead of doing the same physically and also have an upper hand in terms of economical evaluation.\n\nKEYWORDS: Single Acting Cylinders, Double Acting Cylinders, Pump, Motor, Flow ControlValves, Direction Control Valves, Pressure Relief Valves, Hydraulic Circuits",
                    style: TextStyle(
                      color: Colors.blueGrey[200],
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  "Component Details",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image(image:AssetImage('ImageAssets/circuit.jpg'),),
                ),
                ReusableCard(
                  cardChild: ExpansionCard(
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Pump Specs",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            "",
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the RPM
                          rpm = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'RPM Value',
                          prefixIcon: Icon(
                            Icons.rotate_left,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the power rating
                          Powerating = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Power Rating(W)',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(
                            Icons.power,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the power rating
                          dispvol = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Displacement Vol (cm^3)',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(
                            Icons.waves,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPress: () {},
                ),
                ReusableCard(
                  cardChild: ExpansionCard(
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Piston Cylinder Specs",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            "",
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Bore dia
                          Boredia = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Bore Diameter (cm)',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(
                            Icons.radio_button_off_outlined,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Bore dia
                          piston_rod_dia = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Rod Diameter (cm)',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(
                            Icons.radio_button_off_outlined,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the stroke
                          stroke = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Stroke (cm)',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon:
                              Icon(Icons.height_sharp),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPress: () {},
                ),
                ReusableCard(
                  cardChild: ExpansionCard(
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Relief Valve Specs",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            "",
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Pressure Set
                          pressure = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Pressure Set',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon:
                          Icon(Icons.stairs_rounded),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPress: () {},
                ),
                ReusableCard(
                  cardChild: ExpansionCard(
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Piston & Fluid Specs",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          Text(
                            "",
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Pressure Set
                          springconstant = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Spring Constant(Optional)',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon:
                          Icon(Icons.wrap_text_sharp),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Pressure Set
                          piston_mass = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Mass of Piston',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon:
                          Icon(Icons.line_weight),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Pressure Set
                          fluid_viscosity = double.parse(value) * 10;
                        },
                        decoration: InputDecoration(
                          labelText: 'Viscosity',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(
                            Icons.add_road_outlined,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Pressure Set
                          fluid_density = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Density',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(Icons.add_road_outlined,),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Pressure Set
                          pipe_length = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Total Pipe Length (m)',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(Icons.add_road_outlined,),
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Pressure Set
                          pipe_dia = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Pipe Diameter (cm)',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(Icons.add_road_outlined,),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white60),
                        textAlign: TextAlign.start,
                        onChanged: (value) {
//get the Pressure Set
                          pipe_roughness = double.parse(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Pipe Roughness',
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                          prefixIcon: Icon(Icons.add_road_outlined,),
                          labelStyle: TextStyle(
                            color: Colors.blueGrey[200],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  onPress: () {},
                ),
                RoundedButtonSmall(
                  title: "dynamic Simulation",
                  colour:  Colors.blue,
                    onPressed: (){
                    Navigator.pushNamed(context, Dynamic.id);

                }),
                RoundedButtonSmall(
                  title: "Simulate",
                  colour: Colors.blue,
                  onPressed: () {
                    double turningtorq = (Powerating * 60) / (2 * 3.14 * rpm);
                    double flowrate =
                        (rpm * dispvol * pow(10, -6) * 2 * 3.14) / 60; //m^3/s
                    double pressureout = Powerating / (flowrate); //Pascal
                    double areapiston =
                        (3.14 * Boredia * Boredia) / 40000; //m^2
                    double forceonpiston =
                        (pressureout * areapiston) / 1000; //KN
                    double velopiston = flowrate / areapiston;
                    double velocity_fluid = (flowrate * 4) /
                        (3.14 * pow(pipe_dia, 2) * pow(10, -4));

                    // double reynold_num=((fluid_density*velocity_fluid*pipe_length)/fluid_viscosity);
                    double reynold_num = (fluid_density *
                            velocity_fluid *
                            pipe_dia *
                            pow(10, -2)) /
                        fluid_viscosity;

                    double friction_factor = 64 / reynold_num;
                    double area_rod =
                        3.14 * piston_rod_dia * piston_rod_dia / 40000;
                    double headloss = (friction_factor *
                            pipe_length *
                            pow(velocity_fluid, 2)) /
                        (2 * 9.81 * pipe_dia * pow(10, -2));
                    double pressure_diff = ((pressureout - headloss) *
                            areapiston) -
                        ((areapiston - area_rod) *
                            pow(10,
                                5)); //P1A1 - P2A2  ====> P2 = 1atm = 10^5 pascal

                    print("turning torque : $turningtorq");
                    print("flowrate:$flowrate");
                    print("Pressure out $pressureout");
                    print("area of pistion : $areapiston");
                    print("force on piston : $forceonpiston");
                    print("velcocity of pistion : $velopiston");
                    print("Reynolds num=$reynold_num");
                    print("friction factor=$friction_factor");
                    print("headloss=$headloss");
                    print("Pressure Difference=$pressure_diff");
                    print("Velocity of Fluid=$velocity_fluid");
                    Navigator.pushNamed(context, simulationScreen_test2.id,
                        arguments: Attributepasssc1(
                            rpm: rpm,
                            powerrate: Powerating,
                            displvol: dispvol,
                            boredia: Boredia,
                            stroke: stroke,
                            pressureset: pressure,
                            turningtorq: turningtorq,
                            flowrate: flowrate,
                            pressureout: pressureout,
                            areapiston: areapiston,
                            forceonpiston: forceonpiston,
                            velopiston: velopiston,
                            springconstant: springconstant,
                            viscosity: fluid_viscosity,
                            piston_mass: piston_mass,
                            pressure_diff: pressure_diff));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

