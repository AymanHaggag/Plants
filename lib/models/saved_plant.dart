class SavedPlantModel {
  int? id;
  String? commonName;
  String? image;
  String? wateringShort;
  String? sunLightShort;
  String? watering;
  String? wateringDescription;
  String? sunLight;
  String? sunLightDescription;
  String? pruning;
  String? pruningDescription;



  SavedPlantModel(
      {this.id,
        this.commonName,
        this.image,
        this.wateringShort,
        this.sunLightShort,
        this.watering,
        this.wateringDescription,
        this.sunLight,
        this.sunLightDescription,
        this.pruning,
        this.pruningDescription
      });

  SavedPlantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name'];
    image = json['image'];
    wateringShort = json['wateringShort'];
    sunLightShort = json['sunLightShort'];
    watering = json['watering'];
    wateringDescription = json['wateringDescription'];
    sunLight = json['sunLight'];
    sunLightDescription = json['sunLightDescription'];
    pruning = json['pruning'];
    pruningDescription = json['pruningDescription'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['common_name'] = this.commonName;
    data['wateringShort'] = this.wateringShort;
    data['sunLightShort'] = this.sunLightShort;
    data['watering'] = this.watering;
    data['wateringDescription'] = this.wateringDescription;
    data['sunLight'] = this.sunLight;
    data['sunLightDescription'] = this.sunLightDescription;
    data['pruning'] = this.pruning;
    data['pruningDescription'] = this.pruningDescription;
    return data;
  }
}

