class UserProfileModel {
  User? user;

  UserProfileModel({this.user});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? firstName;
  String? lastName;
  dynamic middleName;
  String? birthDate;
  String? phone;
  String? email;
  String? identityNumber;
  dynamic countryId;
  String? avatar;
  String? qualifications;
  String? active;
  String? userType;
  dynamic emailVerifiedAt;
  String? phoneVerification;
  dynamic fcmToken;
  dynamic providerId;
  dynamic provider;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.middleName,
      this.birthDate,
      this.phone,
      this.email,
      this.identityNumber,
      this.countryId,
      this.avatar,
      this.qualifications,
      this.active,
      this.userType,
      this.emailVerifiedAt,
      this.phoneVerification,
      this.fcmToken,
      this.providerId,
      this.provider,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    middleName = json['middle_name'];
    birthDate = json['birth_date'];
    phone = json['phone'];
    email = json['email'];
    identityNumber = json['identity_number'];
    countryId = json['country_id'];
    avatar = json['avatar'];
    qualifications = json['qualifications'];
    active = json['active'];
    userType = json['user_type'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerification = json['phone_verification'];
    fcmToken = json['fcm_token'];
    providerId = json['provider_id'];
    provider = json['provider'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['middle_name'] = this.middleName;
    data['birth_date'] = this.birthDate;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['identity_number'] = this.identityNumber;
    data['country_id'] = this.countryId;
    data['avatar'] = this.avatar;
    data['qualifications'] = this.qualifications;
    data['active'] = this.active;
    data['user_type'] = this.userType;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['phone_verification'] = this.phoneVerification;
    data['fcm_token'] = this.fcmToken;
    data['provider_id'] = this.providerId;
    data['provider'] = this.provider;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
