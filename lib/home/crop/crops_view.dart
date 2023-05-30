import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/home/crop/managers/crop_cubit.dart';
import 'package:la_via/home_screen.dart';
import 'package:la_via/models/crops.dart';

class CropsView extends StatefulWidget {
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
    "images/squash.png",
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
        appBar: AppBar(
          backgroundColor: AppColor.colorGreen,
          title: Text(
            "What You Plant ?",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocConsumer<CropCubit, CropState>(
          listener: (context, state) {},
          builder: (context, state) {
            CropCubit cubit = CropCubit.get(context);
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  var item = cubit.cropDataModel!.crops![index];
                  return cubit.cropDataModel != null
                      ? InkWell(
                          onTap: () {
                            cubit.selectUp(item.soilMoistureMin.toString(),
                                item.soilMoistureMax.toString());
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                          },
                          child: Container(
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
                                    child: Text("${item.cropName ?? ''}"),
                                  ),
                                ]),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator());
                });
          },
        ));
  }
}
