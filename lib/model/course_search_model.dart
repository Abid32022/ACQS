class SearchCourseModel {
  SearchCourseModel({
    required this.data,
  });
  late final List<Data> data;

  SearchCourseModel.fromJson(Map<String, dynamic> json){
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
    required this.primaryCategoryId,
    required this.title,
    required this.description,
    required this.courseConditions,
    this.videoIntro,
    required this.img,
    required this.level,
    required this.featured,
    required this.isActive,
    required this.courseDuration,
    required this.videoDuration,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String primaryCategoryId;
  late final String title;
  late final String description;
  late final String courseConditions;
  late final Null videoIntro;
  late final String img;
  late final String level;
  late final String featured;
  late final String isActive;
  late final String courseDuration;
  late final String videoDuration;
  late final String createdAt;
  late final String updatedAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    primaryCategoryId = json['primary_category_id'];
    title = json['title'];
    description = json['description'];
    courseConditions = json['course_conditions'];
    videoIntro = null;
    img = json['img'];
    level = json['level'];
    featured = json['featured'];
    isActive = json['is_active'];
    courseDuration = json['course_duration'];
    videoDuration = json['video_duration'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['primary_category_id'] = primaryCategoryId;
    _data['title'] = title;
    _data['description'] = description;
    _data['course_conditions'] = courseConditions;
    _data['video_intro'] = videoIntro;
    _data['img'] = img;
    _data['level'] = level;
    _data['featured'] = featured;
    _data['is_active'] = isActive;
    _data['course_duration'] = courseDuration;
    _data['video_duration'] = videoDuration;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}