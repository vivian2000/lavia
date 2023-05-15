import 'package:flutter/material.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/text_form_feild.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Change Name",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: AppColor.colorGreen,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormFieldWidget(
                text: "text", validator: (p0) {}, onChanged: (p0) {}),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 45,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: AppColor.colorGreen)
                  ),
                  child: Center(
                      child: Text(
                    "cancel",
                    style: TextStyle(),
                  )),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 45,
                  width: 90,
                  decoration: BoxDecoration(
                      color: AppColor.colorGreen,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                      child: Text(
                    "save",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
