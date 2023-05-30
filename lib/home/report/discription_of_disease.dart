import 'package:flutter/material.dart';

import 'package:la_via/models/report_details.dart';

class Discription extends StatelessWidget {
   Discription({Key? key,required this.report}) : super(key: key);
   Reports report;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset("images/plant.png"),
        Scaffold(
            backgroundColor: Colors.transparent.withOpacity(0.87),
            body:  Column(
              children: [
                Spacer(),
                Container(
                  height: size.height * 0.6,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 25, top: 25, right: 25),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${report.plantName}",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'Confidence',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '${report.confidence}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'Discription',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '${report.description}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ]),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
