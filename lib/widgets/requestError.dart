import 'package:flutter/material.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/provider/weatherProvider.dart';
import 'package:provider/provider.dart';

class RequestError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 150),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.wrong_location_outlined,
            color: AppColor.colorGreen,
            size: 100,
          ),
          SizedBox(height: 10),
          Text(
            'No Search Result',
            style: TextStyle(
              color: AppColor.colorGreen,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
            child: Text(
              "Please make sure that you entered the correct location or check your device internet connection",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.colorGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            child: Text('Return Home'),
            onPressed: () =>
                Provider.of<WeatherProvider>(context, listen: false)
                    .getWeatherData(isRefresh: true),
          ),
        ],
      ),
    );
  }
}