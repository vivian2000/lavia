class ReportDetails {
  List<Reports>? reports;

  ReportDetails({this.reports});

  ReportDetails.fromJson(Map<String, dynamic> json) {
    if (json['Reports'] != null) {
      reports = <Reports>[];
      json['Reports'].forEach((v) {
        reports!.add(new Reports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.reports != null) {
      data['Reports'] = this.reports!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reports {
  int? id;
  String? plantName;
  double? confidence;
  String? description;

  Reports({this.id, this.plantName, this.confidence, this.description});

  Reports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantName = json['plant_name'];
    confidence = json['confidence'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['plant_name'] = this.plantName;
    data['confidence'] = this.confidence;
    data['description'] = this.description;
    return data;
  }
}