class FAQModel {
  int? id;
  String? question;
  String? answer;
  List<String>? tags;
  DefaultImage? defaultImage;

  FAQModel({this.id, this.question, this.answer, this.tags, this.defaultImage});

  FAQModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    tags = json['tags'].cast<String>();
    defaultImage = json['default_image'] != null
        ? new DefaultImage.fromJson(json['default_image'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['tags'] = this.tags;
    if (this.defaultImage != null) {
      data['default_image'] = this.defaultImage!.toJson();
    }
    return data;
  }
}

class DefaultImage {
  int? license;
  String? licenseName;
  String? licenseUrl;
  String? originalUrl;
  String? regularUrl;
  String? mediumUrl;

  DefaultImage(
      {this.license,
        this.licenseName,
        this.licenseUrl,
        this.originalUrl,
        this.regularUrl,
        this.mediumUrl});

  DefaultImage.fromJson(Map<String, dynamic> json) {
    license = json['license'];
    licenseName = json['license_name'];
    licenseUrl = json['license_url'];
    originalUrl = json['original_url'];
    regularUrl = json['regular_url'];
    mediumUrl = json['medium_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['license'] = this.license;
    data['license_name'] = this.licenseName;
    data['license_url'] = this.licenseUrl;
    data['original_url'] = this.originalUrl;
    data['regular_url'] = this.regularUrl;
    data['medium_url'] = this.mediumUrl;
    return data;
  }
}
