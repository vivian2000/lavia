class CropDataModel {
  List<Crops>? crops;

  CropDataModel({this.crops});

  CropDataModel.fromJson(Map<String, dynamic> json) {
    if (json['crops'] != null) {
      crops = <Crops>[];
      json['crops'].forEach((v) {
        crops!.add(new Crops.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.crops != null) {
      data['crops'] = this.crops!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Crops {
  String? cropName;
  double? soilMoistureMin;
  double? soilMoistureMax;

  Crops({this.cropName, this.soilMoistureMin, this.soilMoistureMax});

  Crops.fromJson(Map<String, dynamic> json) {
    cropName = json['crop_name'];
    soilMoistureMin = json['soil_moisture_min'];
    soilMoistureMax = json['soil_moisture_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['crop_name'] = this.cropName;
    data['soil_moisture_min'] = this.soilMoistureMin;
    data['soil_moisture_max'] = this.soilMoistureMax;
    return data;
  }
}


// class CropsController {
//   List<Crops> crops = [];
//   CropsService _cropsService = CropsService();
//
//   Future<void> fetchCrops() async {
//     try {
//       crops = await _cropsService.fetchCrops();
//     } catch (error) {
//       print('Error fetching embedded data: $error');
//     }
//   }
