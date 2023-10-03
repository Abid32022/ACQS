class SearchResultModel {
  SearchResultModel({
    required this.data,
  });
  late final List<Data> data;

  SearchResultModel.fromJson(Map<String, dynamic> json){
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
    required this.title,
    required this.filePath,
    this.description,
    required this.coverImg,
    required this.downloadingNumber,
    required this.visitingNumber,
    required this.publishDate,
    this.pageNumber,
    this.fileSize,
    required this.createdAt,
    required this.updatedAt,
    required this.imgTemp,
  });
  late final int id;
  late final String title;
  late final String filePath;
  late final Null description;
  late final String coverImg;
  late final String downloadingNumber;
  late final String visitingNumber;
  late final String publishDate;
  late final String? pageNumber;
  late final String? fileSize;
  late final String createdAt;
  late final String updatedAt;
  late final String imgTemp;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    filePath = json['file_path'];
    description = null;
    coverImg = json['cover_img'];
    downloadingNumber = json['downloading_number'];
    visitingNumber = json['visiting_number'];
    publishDate = json['publish_date'];
    pageNumber = null;
    fileSize = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imgTemp = json['img_temp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['file_path'] = filePath;
    _data['description'] = description;
    _data['cover_img'] = coverImg;
    _data['downloading_number'] = downloadingNumber;
    _data['visiting_number'] = visitingNumber;
    _data['publish_date'] = publishDate;
    _data['page_number'] = pageNumber;
    _data['file_size'] = fileSize;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['img_temp'] = imgTemp;
    return _data;
  }
}