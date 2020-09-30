  import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
 var data = [10.0, 5.0, 6.5, 20.0, 21.0, 19.0, 14.5, 0.0, 13.5, 5.0, 25.0, 19.0, 14.5, 0.0, 13.5, 5.0, 25.0];
Material mychart1Items(String title, ) {
    return Material(
      color: Colors.white,
      elevation: 5,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0xff54c5f8).withOpacity(0.25),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: new Sparkline(
                      data: data,
                      lineColor: Color(0xffff6101),
                      pointsMode: PointsMode.all,
                      pointSize: 8.0,
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
