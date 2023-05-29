import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/home/report/managers/disease_cubit.dart';

class Discription extends StatelessWidget {
  const Discription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        children: [
          Image.asset("images/plant.png"),
          BlocProvider(
            create: (context) => DiseaseCubit(),
            child: BlocConsumer<DiseaseCubit, DiseaseState>(
              listener: (context, state) {},
              builder: (context, state) {
                DiseaseCubit data = DiseaseCubit.get(context);
                return Scaffold(
                    backgroundColor: Colors.transparent.withOpacity(0.87),
                    body: ListView.builder(
                      itemCount: data.reportData == null ? 0 : 1,
                      itemBuilder:(context, index){
                        return Column(children: [
                          Spacer(),
                          Container(
                            height: size.height * 0.5,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, top: 25, right: 25),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Text(
                                      "${data.reports.plantName}",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text('Confidence',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                    Text('${data.reports.confidence}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                    Text('Discription',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),),
                                    Text('${data.reports.description}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                      ),)
                                  ]),
                            ),
                          )
                        ]);
                      }
                    )
                );
              },
            ),
          )
        ],
      );
  }
}
