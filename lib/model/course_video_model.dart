class CourseVideoModel {
  CourseVideoModel({
    required this.course,
  });
  late final Course course;

  CourseVideoModel.fromJson(Map<String, dynamic> json){
    course = Course.fromJson(json['course']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['course'] = course.toJson();
    return _data;
  }
}

class Course {
  Course({
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
    required this.rating,
    required this.videoCount,
    required this.ratingCount,
    required this.imgTemp,
    required this.videoTemp,
    required this.subjects,
  });
  late final int id;
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
  late final int rating;
  late final int videoCount;
  late final int ratingCount;
  late final String imgTemp;
  late final String videoTemp;
  late final List<Subjects> subjects;

  Course.fromJson(Map<String, dynamic> json){
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
    rating = json['rating'];
    videoCount = json['video_count'];
    ratingCount = json['rating_count'];
    imgTemp = json['img_temp'];
    videoTemp = json['video_temp'];
    subjects = List.from(json['subjects']).map((e)=>Subjects.fromJson(e)).toList();
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
    _data['rating'] = rating;
    _data['video_count'] = videoCount;
    _data['rating_count'] = ratingCount;
    _data['img_temp'] = imgTemp;
    _data['video_temp'] = videoTemp;
    _data['subjects'] = subjects.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Subjects {
  Subjects({
    required this.id,
    required this.title,
    required this.sortOrder,
    this.referencesText,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
    required this.videos,
  });
  late final int id;
  late final String title;
  late final String sortOrder;
  late final Null referencesText;
  late final String courseId;
  late final String createdAt;
  late final String updatedAt;
  late final List<Videos> videos;

  Subjects.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    sortOrder = json['sort_order'];
    referencesText = null;
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    videos = List.from(json['videos']).map((e)=>Videos.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['sort_order'] = sortOrder;
    _data['references_text'] = referencesText;
    _data['course_id'] = courseId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['videos'] = videos.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Videos {
  Videos({
    required this.id,
    required this.subjectId,
    required this.title,
    required this.sortOrder,
    required this.videoDuration,
    required this.filePath,
    required this.createdAt,
    required this.updatedAt,
    required this.videoTemp,
  });
  late final int id;
  late final String subjectId;
  late final String title;
  late final String sortOrder;
  late final String videoDuration;
  late final String filePath;
  late final String createdAt;
  late final String updatedAt;
  late final String videoTemp;

  Videos.fromJson(Map<String, dynamic> json){
    id = json['id'];
    subjectId = json['subject_id'];
    title = json['title'];
    sortOrder = json['sort_order'];
    videoDuration = json['video_duration'];
    filePath = json['file_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    videoTemp = json['video_temp'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subject_id'] = subjectId;
    _data['title'] = title;
    _data['sort_order'] = sortOrder;
    _data['video_duration'] = videoDuration;
    _data['file_path'] = filePath;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['video_temp'] = videoTemp;
    return _data;
  }
}