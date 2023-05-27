import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:la_via/constants.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';

class EmbeddedData {
  double? temperature;
  double? humidity;
  double? light;
  double? rainfall;
  double? soilMoisture;
  String? updated;
  String? created;
  bool? pumpOn;

  EmbeddedData({
    this.temperature,
    this.humidity,
    this.light,
    this.rainfall,
    this.soilMoisture,
    this.updated,
    this.created,
    this.pumpOn,
  });

  EmbeddedData.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    humidity = json['humidity'];
    light = json['light'];
    rainfall = json['rainfall'];
    soilMoisture = json['soil_moisture'];
    updated = json['updated'];
    created = json['created'];
    pumpOn = json['pump_on'];
  }
}

class EmbeddedDataService {
  late final DioHelper dio = DioHelper();
  Future<List<EmbeddedData>> fetchEmbeddedData() async {
    try {
      final response = await dio.getData(endPoint: embeddedsEndPoint);
       if (response.statusCode == 200) {
         print(response.data.toString());
         final jsonData = json.decode(response.data);
         final embeddedList = jsonData as List<dynamic>;
         print(embeddedList);
         return embeddedList.map((item) => EmbeddedData.fromJson(item)).toList();
       } else {
         throw Exception('Failed to fetch embedded data ${response.statusCode}');
       }
    } catch (error) {
      throw Exception('Error fetching embedded data: $error');
    }
  }
}

class EmbeddedDataController {
  final EmbeddedDataService _embeddedDataService = EmbeddedDataService();
  late final embeddedData;
  Future<List<EmbeddedData>> fetchEmbeddedData() async {
    try {
      embeddedData = await _embeddedDataService.fetchEmbeddedData();
      print(embeddedData.map((embeddedData) => EmbeddedData.fromJson(embeddedData)).toList());
      return embeddedData.map((embeddedData) => EmbeddedData.fromJson(embeddedData)).toList();
    } catch (error) {
      print('Error fetching embedded data: $error');
      return [];
     }
  }
}