import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/model/all_course.dart';
import 'package:untitled6/model/course_video_model.dart';
import 'package:untitled6/model/courses_model.dart';
import 'package:untitled6/utilities/app_constant.dart';
import 'package:untitled6/utilities/app_urls.dart';
import '../model/course_search_model.dart';
import '../model/lecturer_model.dart';

class AllCoursedProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading =>_loading;


  final List<AllCoursesModel> _coursesModel = [];
  List<AllCoursesModel> get coursesModel=>_coursesModel;

  final List<AllLecturerModel> _lecturerModel = [];
  List<AllLecturerModel> get lecturerModel=>_lecturerModel;

  final List<AllCourseModel> _allCourses = [];
  List<AllCourseModel> get allCourses=>_allCourses;

  final List<CourseVideoModel> _courseVideo = [];
  List<CourseVideoModel> get courseVideo=>_courseVideo;

  final List<SearchCourseModel> _searchCourse = [];
  List<SearchCourseModel> get searchCourse=>_searchCourse;
  SharedPreferences? sharedPreferences;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void clearSearchResults() {
    _searchCourse.clear();
    getCoursesBooks();
    notifyListeners();
  }

  final List<dynamic> _storedUrls = [];

  List<dynamic> get storedUrls => _storedUrls;

  void addUrl(String url) {
    _storedUrls.add(url);
    print("this is stored usrl ${_storedUrls.length}");
    _storedUrls.clear();
    notifyListeners();
  }

  Future<void> getCoursesBooks() async {
    setLoading(true);
    notifyListeners();
    final url = AppUrls.baseUrl + AppUrls.courses;
    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
      );
      notifyListeners();
      if (response.statusCode == 200) {
        print("this is hello word ${json.decode(response.body)}");
        setLoading(false);
        _coursesModel.add(AllCoursesModel.fromJson(json.decode(response.body)));

        print("this is hello word12 ${_coursesModel.length}");
        notifyListeners();
      } else {
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
    _coursesModel.clear();
      setLoading(false);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> getAllLecturer() async {
    setLoading(true);
    notifyListeners();
    final url = AppUrls.baseUrl + AppUrls.lecturer;
    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
      );
      notifyListeners();
      if (response.statusCode == 200) {
        print("this is hello word ${json.decode(response.body)}");
        setLoading(false);
        _lecturerModel.clear();
        _lecturerModel.add(AllLecturerModel.fromJson(json.decode(response.body)));
        notifyListeners();
        print("this is hello word ${_coursesModel.length}");
      } else {
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> getCourseVideo({required courseID}) async {
    setLoading(true);
    notifyListeners();


    final url = AppUrls.baseUrl + AppUrls.courseVideo+AppConstant.courseID.toString();
    // final Map<String, dynamic> queryParams = {
    //   'level': 1,
    //   'duration': 150,
    // };
    print("this is id ${AppConstant.courseID.toString()}");

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
      );

    print("this is hello ${response.statusCode}");

      if (response.statusCode == 200) {
        print("this is hello 2${response.statusCode}");
        setLoading(false);
        _courseVideo.clear();
        _courseVideo.add(CourseVideoModel.fromJson(json.decode(response.body)));
        notifyListeners();
        addUrl(_courseVideo[0].course.videoTemp);
        _storedUrls.add(_courseVideo[0].course.subjects[0].videos);

        print("this is hello word ${_storedUrls.length}");
      } else {
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }

    notifyListeners();
  }

  Future<void> searchCourses(String query) async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.courseSearch;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"search": query}), // Assuming your API expects the query parameter
      );

      if (response.statusCode == 200) {
        print("Search results count: ${query}");
        setLoading(false);
        // _searchCourse.clear();
        _searchCourse.add(SearchCourseModel.fromJson(jsonDecode(response.body)));
        notifyListeners();
        print("Search results count: ${_searchCourse.length}");

      } else {
        _searchCourse.clear();
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
    }
  }

  Future<void> getAllCourses() async {
    setLoading(true);
    notifyListeners();
    final url = AppUrls.baseUrl + AppUrls.allCourses;
    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
      );
      notifyListeners();
      if (response.statusCode == 200) {
        print("this is hello word ${json.decode(response.body)}");
        setLoading(false);
        _allCourses.clear();
        _allCourses.add(AllCourseModel.fromJson(json.decode(response.body)));
        notifyListeners();
        print("this is hello word ${_coursesModel.length}");
      } else {
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
    notifyListeners();
  }

}