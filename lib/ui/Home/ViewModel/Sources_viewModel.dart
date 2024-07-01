import 'package:flutter/material.dart';
import 'package:news_app/shared/api/api_manager.dart';

import '../../../model/sources_response/Source.dart';
import '../../../model/sources_response/Sources_response.dart';

class SourcesViewModel extends ChangeNotifier {
List<Source> sourcesList = [];
String? ErrorMassage ;
bool isLoading = false ;

  void GetSources (String categoryID)async{
    isLoading = true ;
    notifyListeners();
   try{
     SourcesResponse result = await ApiManager.getSource(categoryID);
     isLoading = false ;
     if(result.status=='error'){
       ErrorMassage = result.status ;
     }else{
       sourcesList= result.sources ?? [];
     }
     notifyListeners();
   }catch(error){
     isLoading = false;
     ErrorMassage = error.toString() ;
     notifyListeners();

   }
  }
}