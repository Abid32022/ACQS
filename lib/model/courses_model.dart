
class AllCoursesModel {
  List<FeaturedCourses>? featuredCourses;
  List<MostCourses>? mostCourses;
  List<Books>? books;
  List<PrimaryCategory>? primaryCategory;
  List<Courses>? courses;
  List<Tutors>? tutors;
  List<LastNews>? lastNews;

  AllCoursesModel(
      {this.featuredCourses,
        this.mostCourses,
        this.books,
        this.primaryCategory,
        this.courses,
        this.tutors,
        this.lastNews});

  AllCoursesModel.fromJson(Map<dynamic, dynamic> json) {
    if (json['featured_courses'] != null) {
      featuredCourses = <FeaturedCourses>[];
      json['featured_courses'].forEach((v) {
        featuredCourses!.add(new FeaturedCourses.fromJson(v));
      });
    }
    if (json['most_courses'] != null) {
      mostCourses = <MostCourses>[];
      json['most_courses'].forEach((v) {
        mostCourses!.add(new MostCourses.fromJson(v));
      });
    }
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
    if (json['primary_category'] != null) {
      primaryCategory = <PrimaryCategory>[];
      json['primary_category'].forEach((v) {
        primaryCategory!.add(new PrimaryCategory.fromJson(v));
      });
    }
    if (json['courses'] != null) {
      courses = <Courses>[];
      json['courses'].forEach((v) {
        courses!.add(new Courses.fromJson(v));
      });
    }
    if (json['tutors'] != null) {
      tutors = <Tutors>[];
      json['tutors'].forEach((v) {
        tutors!.add(new Tutors.fromJson(v));
      });
    }
    if (json['lastNews'] != null) {
      lastNews = <LastNews>[];
      json['lastNews'].forEach((v) {
        lastNews!.add(new LastNews.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    if (this.tutors != null) {
      data['tutors'] = this.tutors!.map((v) => v.toJson()).toList();
    }
    if (this.lastNews != null) {
      data['lastNews'] = this.lastNews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeaturedCourses {
  int? id;
  dynamic? primaryCategoryId;
  dynamic? title;
  dynamic? description;
  dynamic? courseConditions;
  dynamic? videoIntro;
  dynamic? img;
  dynamic? level;
  dynamic? featured;
  dynamic? isActive;
  dynamic? courseDuration;
  dynamic? videoDuration;
  dynamic? createdAt;
  dynamic? updatedAt;
  int? rating;
  int? videoCount;
  int? ratingCount;
  dynamic? imgTemp;
  dynamic? videoTemp;
  dynamic? certificate;

  FeaturedCourses(
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
       });

  FeaturedCourses.fromJson(Map<dynamic, dynamic> json) {
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
  }
}

class Subjectcourses {
  int? id;
  dynamic? title;
  dynamic? sortOrder;
  dynamic? referencesText;
  dynamic? courseId;
  dynamic? createdAt;
  dynamic? updatedAt;
  List<Subjectvideos>? subjectvideos;

  Subjectcourses(
      {this.id,
        this.title,
        this.sortOrder,
        this.referencesText,
        this.courseId,
        this.createdAt,
        this.updatedAt,
        this.subjectvideos});

  Subjectcourses.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sortOrder = json['sort_order'];
    referencesText = json['references_text'];
    courseId = json['course_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['subjectvideos'] != null) {
      subjectvideos = <Subjectvideos>[];
      json['subjectvideos'].forEach((v) {
        subjectvideos!.add(new Subjectvideos.fromJson(v));
      });
    }
  }
}

class Subjectvideos {
  int? id;
  dynamic? subjectId;
  dynamic? title;
  dynamic? sortOrder;
  dynamic? videoDuration;
  dynamic? filePath;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? videoTemp;
  dynamic? vidprogress;

  Subjectvideos(
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

  Subjectvideos.fromJson(Map<dynamic, dynamic> json) {
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
}

class MostCourses {
  int? id;
  dynamic? primaryCategoryId;
  dynamic? title;
  dynamic? description;
  dynamic? courseConditions;
  dynamic? videoIntro;
  dynamic? img;
  dynamic? level;
  dynamic? featured;
  dynamic? isActive;
  dynamic? courseDuration;
  dynamic? videoDuration;
  dynamic? createdAt;
  dynamic? updatedAt;
  int? rating;
  int? videoCount;
  int? ratingCount;
  dynamic? imgTemp;
  dynamic? videoTemp;
  dynamic? certificate;
  List<Lecturers>? lecturers;
  List<Subjectcourses>? subjectcourses;
  Mysubscriptions? mysubscriptions;

  MostCourses(
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

  MostCourses.fromJson(Map<dynamic, dynamic> json) {
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
}

class Lecturers {
  dynamic? name;
  dynamic? imgTemp;
  Pivot? pivot;

  Lecturers({this.name, this.imgTemp, this.pivot});

  Lecturers.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    imgTemp = json['img_temp'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['name'] = this.name;
    data['img_temp'] = this.imgTemp;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  dynamic? courseId;
  dynamic? lectureId;

  Pivot({this.courseId, this.lectureId});

  Pivot.fromJson(Map<dynamic, dynamic> json) {
    courseId = json['course_id'];
    lectureId = json['lecture_id'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['course_id'] = this.courseId;
    data['lecture_id'] = this.lectureId;
    return data;
  }
}



class Mysubscriptions {
  int? id;
  dynamic? courseId;
  dynamic? userId;
  dynamic? blocked;
  dynamic? startedAt;
  dynamic? endAt;
  dynamic? statue;
  dynamic? createdAt;
  dynamic? updatedAt;

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

  Mysubscriptions.fromJson(Map<dynamic, dynamic> json) {
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

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
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

class Books {
  int? id;
  dynamic? title;
  dynamic? filePath;
  dynamic? description;
  dynamic? coverImg;
  dynamic? downloadingNumber;
  dynamic? visitingNumber;
  dynamic? publishDate;
  dynamic? pageNumber;
  dynamic? fileSize;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? imgTemp;

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

  Books.fromJson(Map<dynamic, dynamic> json) {
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

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
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

class PrimaryCategory {
  int? id;
  dynamic? name;
  dynamic? description;
  dynamic? sortOrder;
  dynamic? certificateFile;
  dynamic? createdAt;
  dynamic? updatedAt;

  PrimaryCategory(
      {this.id,
        this.name,
        this.description,
        this.sortOrder,
        this.certificateFile,
        this.createdAt,
        this.updatedAt});

  PrimaryCategory.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sortOrder = json['sort_order'];
    certificateFile = json['certificate_file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}

class Courses {
  int? id;
  dynamic? primaryCategoryId;
  dynamic? title;
  dynamic? description;
  dynamic? courseConditions;
  dynamic? videoIntro;
  dynamic? img;
  dynamic? level;
  dynamic? featured;
  dynamic? isActive;
  dynamic? courseDuration;
  dynamic? videoDuration;
  dynamic? createdAt;
  dynamic? updatedAt;
  int? rating;
  int? videoCount;
  int? ratingCount;
  dynamic? imgTemp;
  dynamic? videoTemp;
  dynamic? certificate;
  List<Lecturers>? lecturers;
  List<Subjectcourses>? subjectcourses;
  dynamic? mysubscriptions;

  Courses(
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

  Courses.fromJson(Map<dynamic, dynamic> json) {
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
    mysubscriptions = json['mysubscriptions'];
  }
}

class Tutors {
  int? id;
  dynamic? personalImg;
  dynamic? name;
  dynamic? countryId;
  dynamic? currentJob;
  dynamic? qualifications;
  dynamic? certifications;
  dynamic? literatures;
  dynamic? createdAt;
  dynamic? updatedAt;
  dynamic? imgTemp;

  Tutors(
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
        this.imgTemp});

  Tutors.fromJson(Map<dynamic, dynamic> json) {
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

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
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
    return data;
  }
}

class LastNews {
  int? id;
  dynamic? title;
  dynamic? content;
  dynamic? isPost;
  dynamic? createdAt;
  dynamic? updatedAt;

  LastNews(
      {this.id,
        this.title,
        this.content,
        this.isPost,
        this.createdAt,
        this.updatedAt});

  LastNews.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    isPost = json['is_post'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['is_post'] = this.isPost;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

