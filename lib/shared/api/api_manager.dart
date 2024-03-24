import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_response/News_response.dart';
import 'package:news_app/model/sources_response/Sources_response.dart';

class ApiManager {
  //https://newsapi.org/v2/top-headlines/sources?apiKey=20787a7257cb47f6b1338f993974a239&category=business
  static const String apiKey = "20787a7257cb47f6b1338f993974a239";
  static const String baseUrl = "newsapi.org";

  static Future<SourcesResponse> getSource(String categoryID) async {
    var Url = Uri.https(
        baseUrl,
        "v2/top-headlines/sources",
        {'apiKey': apiKey, 'category': categoryID});

   var response = await http.get(Url);
   var json = jsonDecode(response.body);
   SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
   return sourcesResponse;
  }

  static Future<NewsResponse> getNews(String sourceId)async{
    //https://newsapi.org/v2/everything?apiKey=d3e16e322c2e4c00b4b4f4967c290a7f&sources=bbc-news

    var url = Uri.https(baseUrl,"/v2/everything",{
      "apiKey":apiKey,
      "sources":sourceId
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  static Future<NewsResponse> searchNews(String q)async{
    //https://newsapi.org/v2/everything?apiKey=d3e16e322c2e4c00b4b4f4967c290a7f&sources=bbc-news

    var url = Uri.https(baseUrl,"/v2/everything",{
      "apiKey":apiKey,
      "q":q
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

}
