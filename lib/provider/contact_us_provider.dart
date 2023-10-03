import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:untitled6/model/contact_us_model.dart';
import '../utilities/app_urls.dart';

class ContactUsProvider extends ChangeNotifier{
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController messageController =TextEditingController();

  bool _loading = false;
  bool get loading =>_loading;
  bool _butonLoading=false;
  bool get ButtonLoading=>_butonLoading;
  void setButtonLoading(bool value) {
    _butonLoading = value;
    notifyListeners();
  }


  late  ContactUsModel _contactus = ContactUsModel();
  ContactUsModel get ContactUs=> _contactus;

  void clearController(){
    nameController.clear();
    messageController.clear();
    emailController.clear();
  }


  Future<void> postContactUsMessage() async{
    setButtonLoading(true);
    try {

      var headers = {
        'Accept': 'application/json'
      };
      var request = http.MultipartRequest('POST', Uri.parse('https://acqsqatar.uaedubaivisa.com/api/send-message'));
      request.fields.addAll({
        'name': nameController.text,
        'email': emailController.text,
        'message': messageController.text
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        setButtonLoading(false);
        var data = http.Response.fromStream(response);
        clearController();
        print('Success occur ${response.statusCode}');
        print(await response.stream.bytesToString());
      }
      else {
        setButtonLoading(false);
        print('error occur');
        print(response.reasonPhrase);
      }

    }
    catch(e){
      setButtonLoading(false);
    }
  }


  Future<void> getContactUs() async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.contact;
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

        _contactus=ContactUsModel.fromJson(jsonDecode(gree.body));
        notifyListeners();
        print("..........ccccccccc.............this is hello word ${_contactus}");
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

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }


}