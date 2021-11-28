import 'dart:math';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydraulicsim_iitp/SimulationScreen_test2.dart';
import 'package:hydraulicsim_iitp/roundedbuttonsmall.dart';
import 'package:hydraulicsim_iitp/models/attributepasssc1.dart';
import 'SimulationScreen_test1.dart';
import 'package:hydraulicsim_iitp/componentes/reusable_card.dart';

class Dynamic extends StatefulWidget {
  static String id = 'Dynamic_Page';
  @override
  _DynamicState createState() => _DynamicState();
}

class _DynamicState extends State<Dynamic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 150),
                Image(image:AssetImage('ImageAssets/4.png'),height: 150,),
                SizedBox(height: 150),
                Image(image:AssetImage('ImageAssets/4.png'),height: 150,),
                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only( left: 8.0, right: 8.0, top: 16.0, bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Draggable<String>(
                    // Data is the value this Draggable stores.
                    data: 'red',
                      child: Container(
                        child: Center(
                          child: Image.asset('ImageAssets/1.png', height: 75.0,),
                        ),
                      ),
                      feedback: Container(
                        child: Center(
                          child: Image.asset('ImageAssets/1.png', height: 75.0,),
                        ),
                      ),
                    ),
                    Draggable<String>(
                      // Data is the value this Draggable stores.
                      data: 'red',
                      child: Container(
                        child: Center(
                          child: Image.asset('ImageAssets/2.png', height: 75.0,),
                        ),
                      ),
                      feedback: Container(
                        child: Center(
                          child: Image.asset('ImageAssets/2.png', height: 75.0,),
                        ),
                      ),
                    ),
                    Draggable<String>(
                      // Data is the value this Draggable stores.
                      data: 'red',
                      child: Container(
                        child: Center(
                          child: Image.asset('ImageAssets/3.png', height: 75.0,),
                        ),
                      ),
                      feedback: Container(
                        child: Center(
                          child: Image.asset('ImageAssets/3.png', height: 75.0,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
          
        },
      ),
      );
  }
}

