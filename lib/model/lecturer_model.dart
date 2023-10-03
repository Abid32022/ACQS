class AllLecturerModel {
  AllLecturerModel({
    required this.data,
  });
  late final List<Data> data;

  AllLecturerModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.personalImg,
    required this.name,
    required this.countryId,
    required this.currentJob,
    required this.qualifications,
    required this.certifications,
    required this.literatures,
    required this.createdAt,
    required this.updatedAt,
    required this.imgTemp,
  });
  late final int id;
  late final String personalImg;
  late final String name;
  late final String countryId;
  late final String currentJob;
  late final String qualifications;
  late final String certifications;
  late final String literatures;
  late final String createdAt;
  late final String updatedAt;
  late final String imgTemp;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    personalImg = json['personal_img'];
    name = json['name'];
    countryId = json['country_id'];
    currentJob = json['current_job'];
    qualifications = json['qualifications'];
    certifications = json['certifications'];
    literatures = json['literatures'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imgTemp = json['img_temp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['personal_img'] = personalImg;
    _data['name'] = name;
    _data['country_id'] = countryId;
    _data['current_job'] = currentJob;
    _data['qualifications'] = qualifications;
    _data['certifications'] = certifications;
    _data['literatures'] = literatures;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['img_temp'] = imgTemp;
    return _data;
  }
}