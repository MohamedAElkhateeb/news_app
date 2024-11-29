import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/articales_response/articales_response.dart';
import '../model/sources_response/source_response.dart';

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'e9732879c2f5477f8281708d0ef572d1';
  static const String sourcesEndPoint = '/v2/top-headlines/sources';
  static const String articlesEndPoint = '/v2/everything';

  static Future<SourcesResponse> getSources(String categoryId) async{
    Uri url = Uri.https(baseUrl,sourcesEndPoint,{
      'apiKey':apiKey,
      'category':categoryId,
    });
    var response = await http.get(url);
    var json =jsonDecode(response.body);
    SourcesResponse sourcesResponse =SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
  static Future<ArticlesResponse> getArticles(String sourceId,)async{
    Uri url = Uri.https(baseUrl,articlesEndPoint,{
      'apiKey':apiKey,
      'sources':sourceId,
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
  static Future<ArticlesResponse> searchArticles({String query = ''})async{
    Uri url = Uri.https(baseUrl,articlesEndPoint,{
      'apiKey':apiKey,
      'q':query,

    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}