import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/cam/cam.dart';
import 'package:la_via/home/air_quality.dart';
import 'package:la_via/home/home_tap.dart';
import 'package:la_via/home/setting.dart';
import 'package:la_via/home/weather.dart';

List<Widget> tabs = [
  HomeTap(),
  Weather(),
  AirQuality(),
  Setting(),
];
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Name Field",style: TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: AppColor.colorGreen,
      ),
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
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.cloud_outlined,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.air,
                  color: Colors.black,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                  color: Colors.black,
                ),
                label: '')
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
