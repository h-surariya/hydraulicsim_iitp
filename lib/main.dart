import 'package:flutter/material.dart';
import 'package:hydraulicsim_iitp/Graph_single_cylinder.dart';
import 'Attribute.dart';
import 'Statistics.dart';
import 'SimulationScreen_test1.dart';
import 'package:hydraulicsim_iitp/Graph_double_cylinder.dart';
import 'SimulationScreen_test2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:Attribute.id,
      routes:{
        Attribute.id:(context)=>Attribute(),
        Statistics.id:(context)=>Statistics(),
        simulationscreentest1.id:(context)=>simulationscreentest1(),
        Graph_double_cylinder.id:(context)=>Graph_double_cylinder(),
        simulationScreen_test2.id:(context) =>simulationScreen_test2(),
        Graph_single_cylinder.id:(context) =>Graph_single_cylinder(),

      },
    );
  }
}

