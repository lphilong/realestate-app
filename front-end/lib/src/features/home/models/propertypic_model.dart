class Data {
  int? id;
  String? imgName;
  String? propertiesId;

  Data({this.id, this.imgName, this.propertiesId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgName = json['img_name'];
    propertiesId = json['properties_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['img_name'] = imgName;
    data['properties_id'] = propertiesId;
    return data;
  }
}
