class BooksByCategoryModel {
  List<Books>? books;
  List<Category>? category;

  BooksByCategoryModel({this.books, this.category});

  BooksByCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  String? title;
  String? filePath;
  String? description;
  String? coverImg;
  String? downloadingNumber;
  String? visitingNumber;
  String? publishDate;
  String? pageNumber;
  String? fileSize;
  String? createdAt;
  String? updatedAt;
  String? imgTemp;

  Books(
      {this.id,
        this.title,
        this.filePath,
        this.description,
        this.coverImg,
        this.downloadingNumber,
        this.visitingNumber,
        this.publishDate,
        this.pageNumber,
        this.fileSize,
        this.createdAt,
        this.updatedAt,
        this.imgTemp});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    filePath = json['file_path'];
    description = json['description'];
    coverImg = json['cover_img'];
    downloadingNumber = json['downloading_number'];
    visitingNumber = json['visiting_number'];
    publishDate = json['publish_date'];
    pageNumber = json['page_number'];
    fileSize = json['file_size'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imgTemp = json['img_temp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['file_path'] = this.filePath;
    data['description'] = this.description;
    data['cover_img'] = this.coverImg;
    data['downloading_number'] = this.downloadingNumber;
    data['visiting_number'] = this.visitingNumber;
    data['publish_date'] = this.publishDate;
    data['page_number'] = this.pageNumber;
    data['file_size'] = this.fileSize;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['img_temp'] = this.imgTemp;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? description;
  String? sortOrder;
  String? img;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.name,
        this.description,
        this.sortOrder,
        this.img,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sortOrder = json['sort_order'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['sort_order'] = this.sortOrder;
    data['img'] = this.img;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
