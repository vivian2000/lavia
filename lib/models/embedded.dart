import 'package:la_via/constants.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';

class Embedded {
  double? temperature;
  double? humidity;
  String? light;
  double? rainfall;
  double? soilMoisture;
  String? updated;
  String? created;
  bool? pumpOn;

  Embedded(
      {this.temperature,
        this.humidity,
        this.light,
        this.rainfall,
        this.soilMoisture,
        this.updated,
        this.created,
        this.pumpOn});

  Embedded.fromJson(Map<String, dynamic> json) {
    temperature = json['temperature'];
    humidity = json['humidity'];
    light = json['light'];
    rainfall = json['rainfall'];
    soilMoisture = json['soil_moisture'];
    updated = json['updated'];
    created = json['created'];
    pumpOn = json['pump_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['temperature'] = this.temperature;
    data['humidity'] = this.humidity;
    data['light'] = this.light;
    data['rainfall'] = this.rainfall;
    data['soil_moisture'] = this.soilMoisture;
    data['updated'] = this.updated;
    data['created'] = this.created;
    data['pump_on'] = this.pumpOn;
    return data;
  }
}
class EmbeddedService {
  late final DioHelper dio = DioHelper();

  Future<String> fetchEmbedded() async {
    try {
      final response = await dio.getData(endPoint: embeddedEndPoint);
      if (response.statusCode == 200) {
        print(response.statusCode);
        return response.data;
      } else {
        throw Exception('Failed to fetch embedded data ${response.statusMessage}');
      }
    } catch (error) {
      throw Exception('Error fetching embedded data: $error');
    }
  }
}