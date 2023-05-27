import 'package:flutter/material.dart';
import 'package:la_via/home/report/discription_of_disease.dart';

class Report extends StatefulWidget {
   //Report({Key? key}) : super(key: key);
  //Report({XFile? image}) : super(image: image ?? const SizedBox());
  List<String>? imageList;
  Report([this.imageList]);
  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  static List<String> names = ["name of plant"];
  //static List<String> images = [];
  //final List<Model> det = List.generate(names.length, (index) => Model('${names[index]}', '${widget.image[index]}'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: widget.imageList == null?0:widget.imageList!.length,
          //names.length | widget.image!.length == null ? 0 : names.length | widget.image!.length,
          itemBuilder: (context, index) => names.length & widget.imageList!.length == 0 ?
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
                          //child: widget.image![index] == null ? Center(child: Text("No Report Yet"),) : Image.file(File(widget.imageList![index])),
                          // backgroundImage: widget.imageList![index] == null
                            //  ? const Center(child: Text("No Report Yet"),) : Image.file(File(widget.imageList![index])),
                          //widget?.image![index]== null ? Center(child: Text("No Report Yet"),) : widget?.image![index],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      names[index] == null ? "No Report Yet" : names[index],
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
