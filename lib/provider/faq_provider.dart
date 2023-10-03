import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:untitled6/model/faq_model.dart';
import '../utilities/app_urls.dart';

class FaqProvider extends ChangeNotifier{
  bool _loading = false;
  bool get loading =>_loading;


  final List<FaqModel> _faq = [];
  List<FaqModel> get Faq=>_faq;



  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getAllFaq() async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.faq;
    try {
      var headers = {
        'Accept': 'application/json'
      };
      var request = http.MultipartRequest('GET', Uri.parse(url));
      request.fields.addAll({
        'term': 'لأساس'
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {

        var gree= await http.Response.fromStream(response);

        setLoading(false);
        _faq.clear();
        _faq.add(FaqModel.fromJson(jsonDecode(gree.body)));
        notifyListeners();
        print("this is hello word ${_faq.length}");
      } else {
        _faq.clear();
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
    notifyListeners();
  }


}