import 'dart:io';
import 'package:flutter/material.dart';
import 'package:la_via/home/report/discription_of_disease.dart';

class Report extends StatefulWidget {
   //Report({Key? key}) : super(key: key);
  //Report({XFile? image}) : super(image: image ?? const SizedBox());
  List? image;
  Report([this.image]);
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late String _translatorModel;
  void initState() {
    _translatorModel = widget.image as String;
    images = [_translatorModel];
    super.initState();
  }
  static List<String> names = ["name of plant"];
  static List<String> images = [];
  final List<Model> det = List.generate(names.length, (index) => Model('${names[index]}', '${images[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: names.length | images.length == null ? 0 : names.length | images.length,
          itemBuilder: (context, index) => names.length & images.length == 0 ?
             Center(child: Text("No Report Yet"),):InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Discription(),
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
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: CircleAvatar(
                          child: det[index].image == null ? Center(child: Text("No Report Yet"),) : Image.file(File(det[index].image)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      det[index].name == null ? "No Report Yet" :det[index].name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF1D592C),
                    )
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

class Model{
  final String name, image;
  Model(this.name, this.image);
}
