class QuizModel {
  QuizModel({
    required this.course,
    required this.exam,
  });
  late final Course course;
  late final Exam exam;

  QuizModel.fromJson(Map<String, dynamic> json){
    course = Course.fromJson(json['course']);
    exam = Exam.fromJson(json['exam']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['course'] = course.toJson();
    _data['exam'] = exam.toJson();
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
    this.certificate,
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
  late final Null certificate;
  late final String videoTemp;


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
    certificate = null;
    videoTemp = json['video_temp'];

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
    _data['certificate'] = certificate;
    return _data;
  }
}

class Exam {
  Exam({
    required this.id,
    required this.courseId,
    required this.title,
    required this.description,
    required this.successMark,
    required this.createdAt,
    required this.updatedAt,
    required this.questions,
  });
  late final int id;
  late final String courseId;
  late final String title;
  late final String description;
  late final String successMark;
  late final String createdAt;
  late final String updatedAt;
  late final List<Questions> questions;

  Exam.fromJson(Map<String, dynamic> json){
    id = json['id'];
    courseId = json['course_id'];
    title = json['title'];
    description = json['description'];
    successMark = json['success_mark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    questions = List.from(json['questions']).map((e)=>Questions.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['course_id'] = courseId;
    _data['title'] = title;
    _data['description'] = description;
    _data['success_mark'] = successMark;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['questions'] = questions.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Questions {
  Questions({
    required this.id,
    required this.examId,
    required this.questionBody,
    required this.mark,
    required this.createdAt,
    required this.updatedAt,
    required this.multichoices,
  });
  late final int id;
  late final String examId;
  late final String questionBody;
  late final String mark;
  late final String createdAt;
  late final String updatedAt;
  late final List<Multichoices> multichoices;

  Questions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    examId = json['exam_id'];
    questionBody = json['question_body'];
    mark = json['mark'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    multichoices = List.from(json['multichoices']).map((e)=>Multichoices.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['exam_id'] = examId;
    _data['question_body'] = questionBody;
    _data['mark'] = mark;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['multichoices'] = multichoices.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Multichoices {
  Multichoices({
    required this.id,
    required this.questionId,
    required this.choice,
    required this.isCorrect,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String questionId;
  late final String choice;
  late final String isCorrect;
  late final String createdAt;
  late final String updatedAt;

  Multichoices.fromJson(Map<String, dynamic> json){
    id = json['id'];
    questionId = json['question_id'];
    choice = json['choice'];
    isCorrect = json['is_correct'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question_id'] = questionId;
    _data['choice'] = choice;
    _data['is_correct'] = isCorrect;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}