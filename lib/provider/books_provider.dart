import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/model/all_books_model.dart';
import 'package:untitled6/model/search_model.dart';
import 'package:untitled6/utilities/app_constant.dart';
import 'package:untitled6/utilities/app_urls.dart';

import '../model/all_books_by_categoryModel.dart';

class AllBooksProvider extends ChangeNotifier {
  bool _loading = false;
  bool get loading =>_loading;



  final List<AllBooksModel> _books = [];
  List<AllBooksModel> get books=>_books;

  final List<SearchResultModel> _search = [];
  List<SearchResultModel> get search=>_search;

  final List<BooksByCategoryModel> _booksByCategory = [];
  List<BooksByCategoryModel> get booksByCategory=>_booksByCategory;
  SharedPreferences? sharedPreferences;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }


  Future<void> getAllBooks() async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.allBooks;
    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        setLoading(false);
        _books.clear();
        _books.add(AllBooksModel.fromJson(jsonDecode(response.body)));
        notifyListeners();
      } else {
        _books.clear();
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
    notifyListeners();
  }

  Future<void> searchBooks(String query) async {
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.bookSearch;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"term": query}), // Assuming your API expects the query parameter
      );

      if (response.statusCode == 200) {
        setLoading(false);
        _search.clear();
        _booksByCategory.clear();
        _search.add(SearchResultModel.fromJson(jsonDecode(response.body)));
        notifyListeners();
      } else {
        _search.clear();
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
  }

  Future<void> getAllBooksByCategory({required int catID}) async {
    notifyListeners();
    setLoading(true);
    final url = AppUrls.baseUrl + AppUrls.filterBooks+catID.toString();
    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          "Authorization": "Bearer ${AppConstant.getUserToken}",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        setLoading(false);
        Map<String,dynamic> data = jsonDecode(response.body);
        _booksByCategory.clear();
        _booksByCategory.add(BooksByCategoryModel.fromJson(data));
        notifyListeners();
      } else {
        setLoading(false);
        throw Exception('Failed to fetch posts${response.statusCode}');
      }
    } catch (error) {
      setLoading(false);
      notifyListeners();
    }
    notifyListeners();
  }
}