import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/model/NewsRes.dart';
import 'package:news/model/SourcesRes.dart';
import 'package:news/shared/components/constant.dart';

class Api_manager {
  static Future<SourcesRes> getSources(String CategoryID) async {
    Uri URL = Uri.https(Base_URL, 'v2/top-headlines/sources',
        {"apiKey": API_Key, "category": CategoryID});
    Response sources = await http.get(URL);
    try {
      var json = jsonDecode(sources.body);
      SourcesRes response = SourcesRes.fromJson(json);
      return response;
    } catch (e) {
      print("Error$e");
      throw e;
    }
  }

  static Future<NewsRes> getNews(
      {String? singleSource, String? searchkeyword}) async {
    Uri URL = Uri.https(Base_URL, 'v2/everything',
        {"apiKey": API_Key, "sources": singleSource, "q": searchkeyword});

    try {
      Response newsData = await http.get(URL);
      var json = jsonDecode(newsData.body);
      NewsRes response = NewsRes.fromJson(json);
      return response;
    } catch (e) {
      print("Error$e");
      throw e;
    }
  }
}
