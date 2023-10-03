import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/model/course_video_model.dart';
import 'package:untitled6/model/courses_model.dart';
import 'package:untitled6/model/quiz_model.dart';
import 'package:untitled6/utilities/app_constant.dart';
import 'package:untitled6/utilities/app_urls.dart';
import '../model/course_search_model.dart';
import '../model/lecturer_model.dart';

class QuizProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading =>_loading;


   final List<QuizModel> _quizModel=[];
  List<QuizModel> get quizModel=>_quizModel;

  SharedPreferences? sharedPreferences;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void onInIt(){
    super.addListener(() {
      getQuiz();
    });
  }

  Future<void> getQuiz() async {
    setLoading(true);
    notifyListeners();
    final url = AppUrls.baseUrl + AppUrls.quiz;
    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer 468|p9QaBy6E1XGYHOICC7NGWlanvXG261hL6lLa4bvY",
          "Content-Type": "application/json",
        },
      );
      notifyListeners();
      if (response.statusCode == 200) {
        print("this is hello word 32 ${json.decode(response.body)}");
        setLoading(false);
        _quizModel.clear();
        print("quiz url ${url}");
         _quizModel.add(QuizModel.fromJson(json.decode(response.body)));
        print("quiz model ${_quizModel[0].exam.questions[0].multichoices}");
      } else {
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> postQuizAnswer(Map<String, dynamic> query) async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.postQuiz;

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
        body: jsonEncode(query), // Encode the query directly
      );

      if (response.statusCode == 200) {
        setLoading(false);
        notifyListeners();
      } else {
        throw Exception('Failed to fetch posts ${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
  }

}