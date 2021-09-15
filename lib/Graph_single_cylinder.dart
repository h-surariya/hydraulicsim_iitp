import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydraulicsim_iitp/Statistics.dart';
import 'package:hydraulicsim_iitp/models/attributepassc2.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';
import 'package:hydraulicsim_iitp/Attribute.dart';
import 'package:rive/rive.dart';
import 'package:hydraulicsim_iitp/models/attributepassc2.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'piston_position_time_cal.dart';

class Graph_single_cylinder extends StatefulWidget {
  static String id='Graph_single_cylinder';
  @override
  _Graph_single_cylinderState createState() => _Graph_single_cylinderState();
}

class _Graph_single_cylinderState extends State<Graph_single_cylinder> {
  List<double> piston_pos_yaxis=[];
  double highpos=9,highvel=9;
  List<double> piston_pos_xaxis=[];
  List<double> piston_vel_yaxis=[];
  List<double> piston_vel_xaxis=[];
  List<FlSpot> final_piston_pos=[];
  List<FlSpot> final_piston_vel=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //OBJECT CREATION
    Future.delayed(Duration.zero,(){

      Attributepassc2 attributes=ModalRoute.of(context).settings.arguments;
      piston_position_time_cal obj2=new piston_position_time_cal();
      piston_pos_yaxis=obj2.piston_pos_single(attributes.springconstant,attributes.piston_mass,attributes.viscosity,attributes.pressure_diff);
      piston_vel_yaxis=obj2.velocity_grp_single(attributes.springconstant,attributes.piston_mass,attributes.viscosity,attributes.pressure_diff);

      double t=0;
      for(int i=0;i<piston_pos_yaxis.length;i++){
        highpos=max(highpos, piston_pos_yaxis[i]);
        piston_pos_xaxis.add(t);
        t=t+0.01;
      }
      t=0;
      for(int i=0;i<piston_vel_yaxis.length;i++){
        highvel=max(highvel,piston_vel_yaxis[i]);
        piston_vel_xaxis.add(t);
        t=t+0.01;
      }

      for(int i=0;i<piston_pos_xaxis.length;i++){
        final_piston_pos.add(FlSpot(piston_pos_xaxis[i],piston_pos_yaxis[i]));
      }
      for(int i=0;i<piston_vel_xaxis.length;i++){
        final_piston_vel.add(FlSpot(piston_vel_xaxis[i],piston_vel_yaxis[i]));
      }

      setState(() {

      });
    }).then((value) {
      setState(() {

      });
    });



  }


  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black12,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Graphical Analysis",style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),),
              ),
              Column(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          color: Color(0xff232d37)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                        child: LineChart(
                          mainData(),
                        ),
                      ),
                    ),
                  ),
                  Text("Piston Position v/s Time",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
                  SizedBox(
                    height: 40,
                  ),
                  AspectRatio(
                    aspectRatio: 1.70,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(18),
                          ),
                          color: Color(0xff232d37)),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                        child: LineChart(
                          mainData_velocity(),
                        ),
                      ),
                    ),
                  ),
                  Text("Piston Velocity v/s Time",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),),
                ],
              ),
            ],
          ),
        )
    );
  }
  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            if(value==30){
              return "Time Axis";
            }
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {

            return value.toInt().toString();
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 60,
      minY: 0,
      maxY: highpos,
      lineBarsData: [
        LineChartBarData(
          spots:final_piston_pos,
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
  LineChartData mainData_velocity() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            if(value==30){
              return "Time Axis";
            }
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {

            return value.toInt().toString();
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 20,
      minY: 0,
      maxY: highvel,
      lineBarsData: [
        LineChartBarData(
          spots:final_piston_vel,
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) =>
          const TextStyle(color: Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return '1';
              case 5:
                return '2';
              case 8:
                return '3';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 3:
                return '30';
              case 5:
                return '50';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData:
      FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 2.44),
            FlSpot(2.6, 2.44),
            FlSpot(4.9, 2.44),
            FlSpot(6.8, 2.44),
            FlSpot(8, 2.44),
            FlSpot(9.5, 2.44),
            FlSpot(11, 2.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1]).lerp(0.2).withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
