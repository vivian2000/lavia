import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/home/crop/managers/crop_cubit.dart';
import 'package:la_via/models/crops.dart';

class CropsView extends StatefulWidget {
   Crops? cropName;
   CropsView({this.cropName});

  @override
  State<CropsView> createState() => _CropsViewState();
}

class _CropsViewState extends State<CropsView> {
  List<String> fruits = [
    "images/blueberry.png",
    "images/cherry.png",
    "images/cron.png",
    "images/peach.png",
    "images/pepper.png",
    "images/potato.png",
    "images/soybean.png",
    "images/squash.png"
    "images/strawberry.png",
    "images/apple.png",
    "images/grape.png",
    "images/orange.png",
    "images/raspberry.png",
    "images/tomato.png",
  ];

  @override
  void initState() {
    // Fetch the crops name on widget initialization
    // Provider.of<CropsController>(context, listen: false)
    //     .fetchCrops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return BlocProvider(
                      create: (context) => CropCubit()..cropFunction(),
                      child: BlocConsumer<CropCubit, CropState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          CropCubit data = CropCubit.get(context);
                          return Container(
                            child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  Image.asset(
                                    "${fruits[index]}",
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(8),
                                    color: Color.fromRGBO(26, 188, 0, 0.5),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 8),
                                    // child: Text("${data.cropData[index].crops}"),
                                    child:
                                        Text("${widget.cropName!.cropName}"),
                                  ),
                                ]),
                          );
                        },
                      ),
                    );
                  }))
        ]));
  }
}
