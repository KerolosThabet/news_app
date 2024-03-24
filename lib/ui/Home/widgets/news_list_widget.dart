
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response/Article.dart';
import 'package:news_app/model/sources_response/Source.dart';
import 'package:news_app/shared/api/api_manager.dart';
import 'package:news_app/ui/Home/widgets/detalis_screen/detailsScreen.dart';
import 'package:news_app/ui/Home/widgets/new_item.dart';


class NewsListWidget extends StatefulWidget {
   Source source;
   NewsListWidget({super.key, required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: ApiManager.getNews(widget.source.id ?? ''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(),);

        } else if (snapshot.hasError || snapshot.data?.status == 'error') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? snapshot.error.toString()),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text("Try again")),
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
    );
  }
}
