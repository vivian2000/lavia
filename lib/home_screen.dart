import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/cam/cam.dart';
import 'package:la_via/home/report/report.dart';
import 'package:la_via/home/home_tap/home_tap.dart';
import 'package:la_via/home/setting/setting.dart';
import 'package:la_via/home/weather.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTap(),
    Weather(),
    Report(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await availableCameras().then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
        },
        backgroundColor: AppColor.colorGreen,
        child: Icon(Icons.qr_code_scanner_outlined),
        shape: StadiumBorder(
            side: BorderSide(color: AppColor.colorGreen, width: 4)),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.black,
          selectedItemColor: AppColor.colorGreen,
          items: [
            BottomNavigationBarItem(
                icon:Icon( selectedIndex == 0 ?Icons.home:Icons.home_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon:Icon( selectedIndex == 1 ?Icons.cloud:Icons.cloud_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon:Icon( selectedIndex == 2 ?Icons.air:Icons.air_outlined,),
                label: ''),
            BottomNavigationBarItem(
                icon:Icon( selectedIndex == 3 ?Icons.settings:Icons.settings_outlined,),
                label: '')
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
