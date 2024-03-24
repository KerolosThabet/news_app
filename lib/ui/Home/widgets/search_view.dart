import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:news_app/shared/api/api_manager.dart';
import 'package:news_app/ui/Home/widgets/detalis_screen/detailsScreen.dart';
import 'package:news_app/ui/Home/widgets/new_item.dart';

class SearchView extends SearchDelegate{
  @override
  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,

  );


  @override
  List<Widget>? buildActions(BuildContext context) {

  }

  @override
  Widget? buildLeading(BuildContext context) {

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/Background.jpg"),fit: BoxFit.cover )),
      child: FutureBuilder(
        future: ApiManager.searchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError || snapshot.data?.status == 'error') {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
              ],
            );
          }
          var NewsList = snapshot.data?.articles ?? [];
          return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox( height: 20,),
                itemBuilder: (context, index) =>
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DetailsScreen.route,arguments: NewsList[index]);
                        },
                        child: NewsItem(article: NewsList[index])
                    ),

                itemCount: NewsList.length,
              )
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image:AssetImage("assets/images/Background.jpg"),fit: BoxFit.cover )),
      child: query.isEmpty?Center(child: Text("enter Text"),):FutureBuilder(
        future: ApiManager.searchNews(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else if (snapshot.hasError || snapshot.data?.status == 'error') {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(snapshot.data?.message ?? snapshot.error.toString()),
              ],
            );
          }
          var NewsList = snapshot.data?.articles ?? [];
          return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox( height: 20,),
                itemBuilder: (context, index) =>
                    InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, DetailsScreen.route);
                        },
                        child: NewsItem(article: NewsList[index])
                    ),

                itemCount: NewsList.length,
              )
          );
        },
      ),
    );
  }



  
}