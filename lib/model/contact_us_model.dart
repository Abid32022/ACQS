class ContactUsModel {
  Data? data;
  ContacInfo? contacInfo;

  ContactUsModel({this.data, this.contacInfo});

  ContactUsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    contacInfo = json['contac_info'] != null
        ? new ContacInfo.fromJson(json['contac_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.contacInfo != null) {
      data['contac_info'] = this.contacInfo!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? body;
  String? sortOrder;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.title,
        this.body,
        this.sortOrder,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    sortOrder = json['sort_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['sort_order'] = this.sortOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ContacInfo {
  int? id;
  String? phoneNumber1;
  String? phoneNumber2;
  String? email;
  String? address;
  String? createdAt;
  String? updatedAt;

  ContacInfo(
      {this.id,
        this.phoneNumber1,
        this.phoneNumber2,
        this.email,
        this.address,
        this.createdAt,
        this.updatedAt});

  ContacInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNumber1 = json['phone_number_1'];
    phoneNumber2 = json['phone_number_2'];
    email = json['email'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['phone_number_1'] = this.phoneNumber1;
    data['phone_number_2'] = this.phoneNumber2;
    data['email'] = this.email;
    data['address'] = this.address;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}