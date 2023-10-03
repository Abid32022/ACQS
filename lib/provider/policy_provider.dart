import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../model/privacy_policy_model.dart';
import '../utilities/app_urls.dart';
import 'package:http/http.dart'as http;
class PrivacyProvider extends ChangeNotifier{
  bool _loading = false;
  bool get loading =>_loading;


  late  PrivacyPolicyModel _privacyPolicy = PrivacyPolicyModel();
  PrivacyPolicyModel get PrivacyPolicy=> _privacyPolicy;



  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getPrivacyPolicy() async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.policy;
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

        _privacyPolicy=PrivacyPolicyModel.fromJson(jsonDecode(gree.body));
        notifyListeners();
        print("..........ccccccccc.............this is hello word ${_privacyPolicy}");
      } else {
        //  _aboutUs.clear();
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
    notifyListeners();
  }
}