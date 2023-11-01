class PlantDetailsModel {
  int? id;
  int? speciesId;
  String? commonName;
  List<String>? scientificName;
  List<Section>? section;

  PlantDetailsModel(
      {this.id,
        this.speciesId,
        this.commonName,
        this.scientificName,
        this.section});

  PlantDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    speciesId = json['species_id'];
    commonName = json['common_name'];
    scientificName = json['scientific_name'].cast<String>();
    if (json['section'] != null) {
      section = <Section>[];
      json['section'].forEach((v) {
        section!.add(new Section.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['species_id'] = this.speciesId;
    data['common_name'] = this.commonName;
    data['scientific_name'] = this.scientificName;
    if (this.section != null) {
      data['section'] = this.section!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Section {
  int? id;
  String? type;
  String? description;

  Section({this.id, this.type, this.description});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['description'] = this.description;
    return data;
  }
}
