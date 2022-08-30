import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Sourse.dart';

class ApiManager {
  static const String authority = 'newsapi.org';
  static const String apiKey = '1d3c48717d6b4acaaa58c7c3ecaa4a90';

//https://newsapi.org/v2/top-headlines/sources?apiKey=1d3c48717d6b4acaaa58c7c3ecaa4a90
  static Future<SourcesRspons> getSources() async {
    var url =
        Uri.https(authority, '/v2/top-headlines/sources', {'apiKey': apiKey});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    SourcesRspons sourcesRspons = SourcesRspons.fromJson(json);
    return sourcesRspons;
  }
}
