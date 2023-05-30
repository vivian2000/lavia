class SelectUpModel {
  double? soilMoistureMin;
  double? soilMoistureMax;

  SelectUpModel({this.soilMoistureMin, this.soilMoistureMax});

  SelectUpModel.fromJson(Map<String, dynamic> json) {
    soilMoistureMin = json['soil_moisture_min'];
    soilMoistureMax = json['soil_moisture_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['soil_moisture_min'] = this.soilMoistureMin;
    data['soil_moisture_max'] = this.soilMoistureMax;
    return data;
  }
}
