import 'package:flutter/material.dart';
import 'package:la_via/app_color.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeTap extends StatefulWidget {
  HomeTap({Key? key}) : super(key: key);
  static const String routeName = 'Home Tap';

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  List<ReadsDetails> read = [];
  List<ReadsDetails1> read1 = [];

  List<String> days = ['sat','sun','mon','tue','wed','thu','fri'];
  List<double> reads = [73,80,100,50,35,90,85];

  //List<String> day = ['sat','sun','mon','tue','wed','thu','fri'];
  List<double> reead = [85,90,35,55,100,80,73];
  void loadReadData() {
    for (int i =0; i < days.length; i++){
      read.add(ReadsDetails(days[i], reads[i]));
    }
  }
  void loadReadData1() {
    for (int i =0; i < days.length; i++){
      read1.add(ReadsDetails1(days[i], reead[i]));
    }
  }

  @override
  void initState() {
    loadReadData();
    loadReadData1();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Field Name',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.colorGreen,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 100,
                height: 100,
                child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                          radiusFactor: 0.5,
                          interval: 10,
                          startAngle: 0,
                          endAngle: 360,
                          showTicks: false,
                          showLabels: false,
                          axisLineStyle: AxisLineStyle(thickness: 1.5),
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: 73,
                              width: 1.5,
                              color: Color(0xFFdd312e),
                              enableAnimation: true,
                              gradient: SweepGradient(colors: [
                                Color(0xFFdd312e),
                              ], stops: [
                                1.0,
                              ]),
                            )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Column(
                                  children: <Widget>[
                                    Container(
                                        width: 20.00,
                                        height: 20.00,
                                        margin: EdgeInsets.fromLTRB(
                                            0, 20, 0, 0),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                                'images/temp.png'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      child: Container(
                                        child: Text('73°F',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)),
                                      ),
                                    )
                                  ],
                                ),
                                angle: 90,
                                positionFactor: 0.7)
                          ])
                    ]),
              ),
              Container(
                width: 100,
                height: 100,
                child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                          radiusFactor: 0.5,
                          interval: 10,
                          startAngle: 0,
                          endAngle: 360,
                          showTicks: false,
                          showLabels: false,
                          axisLineStyle: AxisLineStyle(thickness: 1.5),
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: 73,
                              width: 1.5,
                              color: Color(0xFF008ECC),
                              enableAnimation: true,
                              gradient: SweepGradient(colors: [
                                Color(0xFF008ECC),
                              ], stops: [
                                1.0,
                              ]),
                            )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Column(
                                  children: <Widget>[
                                    Container(
                                        width: 20.00,
                                        height: 20.00,
                                        margin: EdgeInsets.fromLTRB(
                                            0, 20, 0, 0),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                                'images/humidity.png'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      child: Container(
                                        child: Text('73°F',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)),
                                      ),
                                    )
                                  ],
                                ),
                                angle: 90,
                                positionFactor: 0.7)
                          ])
                    ]),
              ),
              Container(
                width: 100,
                height: 100,
                child: SfRadialGauge(
                    enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(
                          radiusFactor: 0.5,
                          interval: 10,
                          startAngle: 0,
                          endAngle: 360,
                          showTicks: false,
                          showLabels: false,
                          axisLineStyle: AxisLineStyle(thickness: 1.5),
                          pointers: <GaugePointer>[
                            RangePointer(
                              value: 73,
                              width: 1.5,
                              color: Color(0xFF424242),
                              enableAnimation: true,
                              gradient: SweepGradient(colors: [
                                Color(0xFF424242),
                              ], stops: [
                                1.0,
                              ]),
                            )
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                                widget: Column(
                                  children: <Widget>[
                                    Container(
                                        width: 20.00,
                                        height: 20.00,
                                        margin: EdgeInsets.fromLTRB(
                                            0, 20, 0, 0),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: ExactAssetImage(
                                                'images/soil.png'),
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )),
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 2, 0, 0),
                                      child: Container(
                                        child: Text('73°F',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10)),
                                      ),
                                    )
                                  ],
                                ),
                                angle: 90,
                                positionFactor: 0.7)
                          ])
                    ]),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                child: SfRadialGauge(enableLoadingAnimation: true, axes: <
                    RadialAxis>[
                  RadialAxis(
                      radiusFactor: 0.5,
                      startAngle: 0,
                      endAngle: 360,
                      minimum: 0,
                      maximum: 100,
                      useRangeColorForAxis: true,
                      showTicks: false,
                      showLabels: false,
                      canScaleToFit: true,
                      axisLineStyle: AxisLineStyle(
                        thickness: 1.5,
                      ),
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: 73,
                          width: 1.5,
                          enableAnimation: true,
                          gradient: SweepGradient(colors: [
                            Color(0xFF73c5f1),
                          ], stops: [
                            1.0,
                          ]),
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Column(
                              children: <Widget>[
                                Container(
                                    width: 20.00,
                                    height: 20.00,
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: ExactAssetImage(
                                            'images/rain.png'),
                                        //fit: BoxFit.fitHeight,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                  child: Container(
                                    child: Text('73°F',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                  ),
                                )
                              ],
                            ),
                            angle: 90,
                            positionFactor: 0.7)
                      ])
                ]),
              ),
              Container(
                width: 100,
                height: 100,
                child: SfRadialGauge(enableLoadingAnimation: true, axes: <
                    RadialAxis>[
                  RadialAxis(
                      radiusFactor: 0.5,
                      interval: 10,
                      startAngle: 0,
                      endAngle: 360,
                      showTicks: false,
                      showLabels: false,
                      axisLineStyle: AxisLineStyle(thickness: 1.5),
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: 73,
                          width: 1.5,
                          color: Color(0xFF69A297),
                          enableAnimation: true,
                          gradient: SweepGradient(colors: [
                            Color(0xFF69A297),
                          ], stops: [
                            1.0,
                          ]),
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Column(
                              children: <Widget>[
                                Container(
                                    width: 20.00,
                                    height: 20.00,
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: ExactAssetImage(
                                            'images/pump.png'),
                                        //fit: BoxFit.fitHeight,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                  child: Container(
                                    child: Text('on',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                  ),
                                )
                              ],
                            ),
                            angle: 90,
                            positionFactor: 0.7)
                      ])
                ]),
              ),
              Container(
                width: 100,
                height: 100,
                child: SfRadialGauge(enableLoadingAnimation: true, axes: <
                    RadialAxis>[
                  RadialAxis(
                      radiusFactor: 0.5,
                      interval: 10,
                      startAngle: 0,
                      endAngle: 360,
                      showTicks: false,
                      showLabels: false,
                      axisLineStyle: AxisLineStyle(thickness: 1.5),
                      pointers: <GaugePointer>[
                        RangePointer(
                          value: 73,
                          width: 1.5,
                          color: Color(0xFFF1BC12),
                          enableAnimation: true,
                          gradient: SweepGradient(colors: [
                            Color(0xFFF1BC12),
                          ], stops: [
                            1.0,
                          ]),
                        )
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                            widget: Column(
                              children: <Widget>[
                                Container(
                                    width: 20.00,
                                    height: 20.00,
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            ExactAssetImage('images/sun.png'),
                                        fit: BoxFit.fitHeight,
                                      ),
                                    )),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 0),
                                  child: Container(
                                    child: Text('73°F',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10)),
                                  ),
                                )
                              ],
                            ),
                            angle: 90,
                            positionFactor: 0.7)
                      ])
                ]),
              ),
            ],
          ),
          Divider(
            color: AppColor.colorGreen,
            height: 1,
          ),
          SizedBox(height: size.height * 0.05,),
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries>[
              LineSeries<ReadsDetails, String>(
                  dataSource: read,
                  xValueMapper: (ReadsDetails details, _) => details.days,
                  yValueMapper: (ReadsDetails details, _) => details.reads,),
              LineSeries<ReadsDetails1, String>(
                dataSource: read1,
                xValueMapper: (ReadsDetails1 details, _) => details.days,
                yValueMapper: (ReadsDetails1 details, _) => details.reead,),
            ],
          )
        ],
      ),
    );
  }
}

class ReadsDetails {
  ReadsDetails(this.days, this.reads);

  final String days;
  final double reads;
}
class ReadsDetails1 {
  ReadsDetails1(this.days, this.reead);
  final String days;
  final double reead;

}
