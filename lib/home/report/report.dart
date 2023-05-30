import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/home/report/discription_of_disease.dart';
import 'package:la_via/home/report/managers/disease_cubit.dart';

class Report extends StatefulWidget {
  //Report({Key? key}) : super(key: key);
  //Report({XFile? image}) : super(image: image ?? const SizedBox());
  List<String>? imageList;

  Report([this.imageList]);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  static List<String> names = [];

  //static List<String> images = [];
  //final List<Model> det = List.generate(names.length, (index) => Model('${names[index]}', '${widget.image[index]}'));
  @override
  void initState() {
    context.read<DiseaseCubit>().reportFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(),
        title: Text(
          "Reports",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.colorGreen,
      ),
      body: BlocBuilder<DiseaseCubit, DiseaseState>(
        builder: (context, state) {
          var cubit = DiseaseCubit.get(context);
          if (cubit.report != null) {
            return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10,),
                  itemCount: cubit.report!.reports!.length,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    String? name = cubit.report!.reports![index].plantName;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Discription(report: cubit.report!.reports![index]),
                          ),
                        );
                      },
                      child: Container(
                        height: 85,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: Colors.transparent.withOpacity(0.19))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                name ?? 'Loading',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Color(0xFF1D592C),
                            )
                          ],
                        ),
                      ),
                    );
                  });
          } else {
            return const Center(
                  child: CircularProgressIndicator(),
                );
          }
        },
      ),
    );
  }
}

class Model {
  final String name, image;

  Model(this.name, this.image);
}
