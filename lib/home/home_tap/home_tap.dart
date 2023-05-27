import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/home/home_tap/managers/embedded_data_cubit.dart';
import 'package:la_via/home/setting/managers/get_profile_data_cubit.dart';
import 'package:la_via/models/embeddedData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({Key? key}) : super(key: key);
  static const String routeName = 'Home Tap';

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => EmbeddedDataCubit()..fetchEmededData()..fetchDataInTop(),
      child: BlocConsumer<EmbeddedDataCubit, EmbeddedDataState>(
        listener: (context, state) {
          if(state is EmbeddedDataSuccessState) {

          }
          else if(state is EmbeddedDataErrorState) {
            SnackBar snackBar = const SnackBar(content: Text('Erro in Get Embedded'));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          EmbeddedDataCubit data =
          EmbeddedDataCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: Container(),
              title: const Text(
                'Vivian',
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
                                axisLineStyle: const AxisLineStyle(thickness: 1.5),
                                pointers: <GaugePointer>[
                                   RangePointer(
                                    value: data.embedded.temperature!.toDouble() ?? 50,
                                    width: 1.5,
                                    color: const Color(0xFFdd312e),
                                    enableAnimation: true,
                                    gradient: const SweepGradient(colors: [
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 20, 0, 0),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: ExactAssetImage(
                                                      'images/temp.png'),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              )),
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                            child: Container(
                                              // child: const Text('73°F',
                                              child: Text(data.embedded.temperature.toString(),
                                                  style: const TextStyle(
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
                                axisLineStyle: const AxisLineStyle(thickness: 1.5),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: data.embedded.humidity!.toDouble(),
                                    width: 1.5,
                                    color: const Color(0xFF008ECC),
                                    enableAnimation: true,
                                    gradient: const SweepGradient(colors: [
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 20, 0, 0),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: ExactAssetImage(
                                                      'images/humidity.png'),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              )),
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                            child: Container(
                                              child: Text(data.embedded.humidity.toString(),
                                                  style: const TextStyle(
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
                                axisLineStyle: const AxisLineStyle(thickness: 1.5),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: data.embedded.soilMoisture!.toDouble(),
                                    width: 1.5,
                                    color: const Color(0xFF424242),
                                    enableAnimation: true,
                                    gradient: const SweepGradient(colors: [
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 20, 0, 0),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: ExactAssetImage(
                                                      'images/soil.png'),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              )),
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                            child: Container(
                                              child: Text(data.embedded.soilMoisture.toString(),
                                                  style: const TextStyle(
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
                      child: SfRadialGauge(
                          enableLoadingAnimation: true,
                          axes: <RadialAxis>[
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
                                axisLineStyle: const AxisLineStyle(
                                  thickness: 1.5,
                                ),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: data.embedded.rainfall!.toDouble(),
                                    width: 1.5,
                                    enableAnimation: true,
                                    gradient: const SweepGradient(colors: [
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 20, 0, 0),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: ExactAssetImage(
                                                      'images/rain.png'),
                                                  //fit: BoxFit.fitHeight,
                                                ),
                                              )),
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                            child: Container(
                                              child: Text(data.embedded.rainfall.toString(),
                                                  style: const TextStyle(
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
                                axisLineStyle: const AxisLineStyle(thickness: 1.5),
                                pointers: <GaugePointer>[
                                  const RangePointer(
                                    value: 100,
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 20, 0, 0),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: ExactAssetImage(
                                                      'images/pump.png'),
                                                  //fit: BoxFit.fitHeight,
                                                ),
                                              )),
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                            child: Container(
                                              child: Text(data.embedded.pumpOn.toString(),
                                                  style: const TextStyle(
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
                                axisLineStyle: const AxisLineStyle(thickness: 1.5),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    value: data.embedded.light!.toDouble(),
                                    width: 1.5,
                                    color: const Color(0xFFF1BC12),
                                    enableAnimation: true,
                                    gradient: const SweepGradient(colors: [
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
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 20, 0, 0),
                                              decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                  image: ExactAssetImage(
                                                      'images/sun.png'),
                                                  fit: BoxFit.fitHeight,
                                                ),
                                              )),
                                          Padding(
                                            padding:
                                            const EdgeInsets.fromLTRB(0, 2, 0, 0),
                                            child: Container(
                                              child: Text(data.embedded.light.toString(),
                                                  style: const TextStyle(
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
                const Divider(
                  color: AppColor.colorGreen,
                  height: 1,
                ),
                BlocConsumer<EmbeddedDataCubit, EmbeddedDataState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (data.embeddedData.isEmpty) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          series: <ChartSeries>[
                            LineSeries<EmbeddedData, String>(
                              color: const Color(0xFFdd312e),
                              dataSource: data.embeddedData,
                              xValueMapper: (data, _) => data.updated ?? '',
                              yValueMapper: (data, _) => data.temperature ?? 0,
                              name: 'Temperature',
                            ),
                            LineSeries<EmbeddedData, String>(
                              color: const Color(0xFF008ECC),
                              dataSource: data.embeddedData,
                              xValueMapper: (data, _) => data.updated ?? '',
                              yValueMapper: (data, _) => data.humidity ?? 0,
                              name: 'Humidity',
                            ),
                            LineSeries<EmbeddedData, String>(
                              color: const Color(0xFF424242),
                              dataSource: data.embeddedData,
                              xValueMapper: (data, _) => data.updated ?? '',
                              yValueMapper: (data, _) => data.soilMoisture ?? 0,
                              name: 'Soil Moisture',
                            ),
                            LineSeries<EmbeddedData, String>(
                              color: const Color(0xFF73c5f1),
                              dataSource: data.embeddedData,
                              xValueMapper: (data, _) => data.updated ?? '',
                              yValueMapper: (data, _) => data.rainfall ?? 0,
                              name: 'Rain Fall',
                            ),
                          ],
                        );
                      }
                    }),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class ReadsDetails {
//   ReadsDetails(this.days, this.reads);
//
//   final String days;
//   final double reads;
// }
//
// class ReadsDetails1 {
//   ReadsDetails1(this.days, this.reead);
//
//   final String days;
//   final double reead;
// }
