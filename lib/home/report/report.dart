import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_via/home/report/discription_of_disease.dart';

class Report extends StatefulWidget {
   //Report({Key? key}) : super(key: key);
  //Report({XFile? image}) : super(image: image ?? const SizedBox());
  XFile? image;
  Report([this.image]);
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  late XFile _translatorModel;
  void initState() {
    _translatorModel = widget.image!;
    images = [_translatorModel];
    super.initState();
  }
  static List<String> names = ["name of plant"];
  static List<XFile> images = [];
  final List<Model> det = List.generate(names.length, (index) => Model('${names[index]}', '${images[index]}' as XFile));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, index) {
            return InkWell(
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
                          child: Image.file(File(_translatorModel.path)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      det[index].name,
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
            );
          }),
    );
  }
}

class Model{
  final String name;
  final XFile image;
  Model(this.name, this.image);
}
