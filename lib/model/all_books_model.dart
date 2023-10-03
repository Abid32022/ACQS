class AllBooksModel {
  AllBooksModel({
    required this.books,
    required this.categories,
  });
  late final Books books;
  late final List<Categories> categories;

  AllBooksModel.fromJson(Map<String, dynamic> json){
    books = Books.fromJson(json['books']);
    categories = List.from(json['categories']).map((e)=>Categories.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['books'] = books.toJson();
    _data['categories'] = categories.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Books {
  Books({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });
  late final int currentPage;
  late final List<Data> data;
  late final String firstPageUrl;
  late final int from;
  late final int lastPage;
  late final String lastPageUrl;
  late final List<Links> links;
  late final Null nextPageUrl;
  late final String path;
  late final int perPage;
  late final Null prevPageUrl;
  late final int to;
  late final int total;

  Books.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    nextPageUrl = null;
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = null;
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_page'] = currentPage;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['first_page_url'] = firstPageUrl;
    _data['from'] = from;
    _data['last_page'] = lastPage;
    _data['last_page_url'] = lastPageUrl;
    _data['links'] = links.map((e)=>e.toJson()).toList();
    _data['next_page_url'] = nextPageUrl;
    _data['path'] = path;
    _data['per_page'] = perPage;
    _data['prev_page_url'] = prevPageUrl;
    _data['to'] = to;
    _data['total'] = total;
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
  late final String? description;
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

class Links {
  Links({
    this.url,
    required this.label,
    required this.active,
  });
  late final String? url;
  late final String label;
  late final bool active;

  Links.fromJson(Map<String, dynamic> json){
    url = null;
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['label'] = label;
    _data['active'] = active;
    return _data;
  }
}

class Categories {
  Categories({
    required this.id,
    required this.name,
    this.description,
    required this.sortOrder,
    this.img,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  late final String? description;
  late final String sortOrder;
  late final String? img;
  late final String createdAt;
  late final String updatedAt;

  Categories.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = null;
    sortOrder = json['sort_order'];
    img = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['sort_order'] = sortOrder;
    _data['img'] = img;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}