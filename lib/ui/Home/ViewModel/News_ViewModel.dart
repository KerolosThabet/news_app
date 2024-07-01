import 'package:flutter/material.dart';
import 'package:news_app/model/news_response/Article.dart';
import 'package:news_app/shared/api/api_manager.dart';

import '../../../model/news_response/News_response.dart';

class NewsViewModel extends ChangeNotifier {
  List<Article> articlesList = [];
  String? ErrorMassage ;
  bool isLoading = false ;

  void GetNews (String sourceId)async{
    isLoading = true ;
    notifyListeners();
    try{
      NewsResponse result = await ApiManager.getNews(sourceId);
      isLoading = false ;
      if(result.status=='error'){
        ErrorMassage = result.status ;
      }else{
        articlesList= result.articles ?? [];
      }
      notifyListeners();
    }catch(error){
      isLoading = false;
      ErrorMassage = error.toString() ;
      notifyListeners();

    }
  }
}