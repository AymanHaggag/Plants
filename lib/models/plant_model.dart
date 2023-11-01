class PlantModel {
  int? id;
  String? commonName;
  List<String>? scientificName;
  List<String>? otherName;
  String? cycle;
  String? watering;
  List<String>? sunlight;
  DefaultImage? images ;


  PlantModel(
      {this.id,
        this.commonName,
        this.scientificName,
        this.otherName,
        this.cycle,
        this.watering,
        this.sunlight,
        this.images});

  PlantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commonName = json['common_name'];
    scientificName = json['scientific_name'].cast<String>();
    otherName = json['other_name'].cast<String>();
    cycle = json['cycle'];
    watering = json['watering'];
    sunlight = json['sunlight'].cast<String>();
    images = json['default_image'] != null
        ? new DefaultImage.fromJson(json['default_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['common_name'] = this.commonName;
    data['scientific_name'] = this.scientificName;
    data['other_name'] = this.otherName;
    data['cycle'] = this.cycle;
    data['watering'] = this.watering;
    data['sunlight'] = this.sunlight;
    if (this.images != null) {
      data['default_image'] = this.images!.toJson();
    }
    return data;
  }
}

class DefaultImage {
  String? licenseName;
  String? licenseUrl;
  String? originalUrl;
  String? regularUrl;
  String? mediumUrl;
  String? smallUrl;
  String? thumbnail;
  List<String> imagesList=[];


  DefaultImage(
      {
        this.licenseName,
        this.licenseUrl,
        this.originalUrl,
        this.regularUrl,
        this.mediumUrl,
        this.smallUrl,
        this.thumbnail});

  DefaultImage.fromJson(Map<String, dynamic> json) {
    imagesList.add(json['license_name']);
    imagesList.add(json['license_url']);
    imagesList.add(json['original_url']);
    imagesList.add(json['regular_url']);
    imagesList.add(json['medium_url']);
    imagesList.add(json['small_url']);
    imagesList.add(json['thumbnail']);

    licenseName = json['license_name'];
    licenseUrl = json['license_url'];
    originalUrl = json['original_url'];
    regularUrl = json['regular_url'];
    mediumUrl = json['medium_url'];
    smallUrl = json['small_url'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['license_name'] = this.licenseName;
    data['license_url'] = this.licenseUrl;
    data['original_url'] = this.originalUrl;
    data['regular_url'] = this.regularUrl;
    data['medium_url'] = this.mediumUrl;
    data['small_url'] = this.smallUrl;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
