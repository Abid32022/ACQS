class AllCourseModel {
  List<Allcourses>? allcourses;

  AllCourseModel({this.allcourses});

  AllCourseModel.fromJson(Map<String, dynamic> json) {
    if (json['allcourses'] != null) {
      allcourses = <Allcourses>[];
      json['allcourses'].forEach((v) {
        allcourses!.add(new Allcourses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allcourses != null) {
      data['allcourses'] = this.allcourses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allcourses {
  int? id;
  String? primaryCategoryId;
  String? title;
  String? description;
  String? courseConditions;
  String? videoIntro;
  String? img;
  String? level;
  String? featured;
  String? isActive;
  String? courseDuration;
  String? videoDuration;
  String? createdAt;
  String? updatedAt;
  int? rating;
  int? videoCount;
  int? ratingCount;
  String? imgTemp;
  String? videoTemp;
  Null? certificate;
  List<Lecturers>? lecturers;
  List<Subjectcourses>? subjectcourses;
  Mysubscriptions? mysubscriptions;

  Allcourses(
      {this.id,
        this.primaryCategoryId,
        this.title,
        this.description,
        this.courseConditions,
        this.videoIntro,
        this.img,
        this.level,
        this.featured,
        this.isActive,
        this.courseDuration,
        this.videoDuration,
        this.createdAt,
        this.updatedAt,
        this.rating,
        this.videoCount,
        this.ratingCount,
        this.imgTemp,
        this.videoTemp,
        this.certificate,
        this.lecturers,
        this.subjectcourses,
        this.mysubscriptions});

  Allcourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryCategoryId = json['primary_category_id'];
    title = json['title'];
    description = json['description'];
    courseConditions = json['course_conditions'];
    videoIntro = json['video_intro'];
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
    certificate = json['certificate'];
    if (json['lecturers'] != null) {
      lecturers = <Lecturers>[];
      json['lecturers'].forEach((v) {
        lecturers!.add(new Lecturers.fromJson(v));
      });
    }
    if (json['subjectcourses'] != null) {
      subjectcourses = <Subjectcourses>[];
      json['subjectcourses'].forEach((v) {
        subjectcourses!.add(new Subjectcourses.fromJson(v));
      });
    }
    mysubscriptions = json['mysubscriptions'] != null
        ? new Mysubscriptions.fromJson(json['mysubscriptions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['primary_category_id'] = this.primaryCategoryId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['course_conditions'] = this.courseConditions;
    data['video_intro'] = this.videoIntro;
    data['img'] = this.img;
    data['level'] = this.level;
    data['featured'] = this.featured;
    data['is_active'] = this.isActive;
    data['course_duration'] = this.courseDuration;
    data['video_duration'] = this.videoDuration;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['rating'] = this.rating;
    data['video_count'] = this.videoCount;
    data['rating_count'] = this.ratingCount;
    data['img_temp'] = this.imgTemp;
    data['video_temp'] = this.videoTemp;
    data['certificate'] = this.certificate;
    if (this.lecturers != null) {
      data['lecturers'] = this.lecturers!.map((v) => v.toJson()).toList();
    }
    if (this.subjectcourses != null) {
      data['subjectcourses'] =
          this.subjectcourses!.map((v) => v.toJson()).toList();
    }
    if (this.mysubscriptions != null) {
      data['mysubscriptions'] = this.mysubscriptions!.toJson();
    }
    return data;
  }
}

class Lecturers {
  int? id;
  String? personalImg;
  String? name;
  String? countryId;
  String? currentJob;
  String? qualifications;
  String? certifications;
  String? literatures;
  String? createdAt;
  String? updatedAt;
  String? imgTemp;
  Pivot? pivot;

  Lecturers(
      {this.id,
        this.personalImg,
        this.name,
        this.countryId,
        this.currentJob,
        this.qualifications,
        this.certifications,
        this.literatures,
        this.createdAt,
        this.updatedAt,
        this.imgTemp,
        this.pivot});

  Lecturers.fromJson(Map<String, dynamic> json) {
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
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['personal_img'] = this.personalImg;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    data['current_job'] = this.currentJob;
    data['qualifications'] = this.qualifications;
    data['certifications'] = this.certifications;
    data['literatures'] = this.literatures;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['img_temp'] = this.imgTemp;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? courseId;
  String? lectureId;

  Pivot({this.courseId, this.lectureId});

  Pivot.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    lectureId = json['lecture_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['lecture_id'] = this.lectureId;
    return data;
  }
}

class Subjectcourses {
  int? id;
  String? title;
  String? sortOrder;
  String? referencesText;
  String? courseId;
  String? createdAt;
  String? updatedAt;
  List<SubjectVideos>? subjectvideos;

  Subjectcourses(
      {this.id,
        this.title,
        this.sortOrder,
        this.referencesText,
        this.courseId,
        this.createdAt,
        this.updatedAt,
        this.subjectvideos});

  Subjectcourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sortOrder = json['sort_order'];
    referencesText = json['references_text'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['subjectvideos'] != null) {
      subjectvideos = <SubjectVideos>[];
      json['subjectvideos'].forEach((v) {
        subjectvideos!.add(new SubjectVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sort_order'] = this.sortOrder;
    data['references_text'] = this.referencesText;
    data['course_id'] = this.courseId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.subjectvideos != null) {
      data['subjectvideos'] =
          this.subjectvideos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubjectVideos {
  int? id;
  String? subjectId;
  String? title;
  String? sortOrder;
  String? videoDuration;
  String? filePath;
  String? createdAt;
  String? updatedAt;
  String? videoTemp;
  Null? vidprogress;

  SubjectVideos(
      {this.id,
        this.subjectId,
        this.title,
        this.sortOrder,
        this.videoDuration,
        this.filePath,
        this.createdAt,
        this.updatedAt,
        this.videoTemp,
        this.vidprogress});

  SubjectVideos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subjectId = json['subject_id'];
    title = json['title'];
    sortOrder = json['sort_order'];
    videoDuration = json['video_duration'];
    filePath = json['file_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    videoTemp = json['video_temp'];
    vidprogress = json['vidprogress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject_id'] = this.subjectId;
    data['title'] = this.title;
    data['sort_order'] = this.sortOrder;
    data['video_duration'] = this.videoDuration;
    data['file_path'] = this.filePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['video_temp'] = this.videoTemp;
    data['vidprogress'] = this.vidprogress;
    return data;
  }
}

class Mysubscriptions {
  int? id;
  String? courseId;
  String? userId;
  String? blocked;
  String? startedAt;
  Null? endAt;
  String? statue;
  String? createdAt;
  String? updatedAt;

  Mysubscriptions(
      {this.id,
        this.courseId,
        this.userId,
        this.blocked,
        this.startedAt,
        this.endAt,
        this.statue,
        this.createdAt,
        this.updatedAt});

  Mysubscriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseId = json['course_id'];
    userId = json['user_id'];
    blocked = json['blocked'];
    startedAt = json['started_at'];
    endAt = json['end_at'];
    statue = json['statue'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course_id'] = this.courseId;
    data['user_id'] = this.userId;
    data['blocked'] = this.blocked;
    data['started_at'] = this.startedAt;
    data['end_at'] = this.endAt;
    data['statue'] = this.statue;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
