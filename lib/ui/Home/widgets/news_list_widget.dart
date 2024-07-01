
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response/Article.dart';
import 'package:news_app/model/sources_response/Source.dart';
import 'package:news_app/shared/api/api_manager.dart';
import 'package:news_app/ui/Home/ViewModel/News_ViewModel.dart';
import 'package:news_app/ui/Home/ViewModel/Sources_viewModel.dart';
import 'package:news_app/ui/Home/widgets/detalis_screen/detailsScreen.dart';
import 'package:news_app/ui/Home/widgets/new_item.dart';
import 'package:provider/provider.dart';


class NewsListWidget extends StatefulWidget {
   Source source;
   NewsListWidget({super.key, required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var ViewModel =NewsViewModel() ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.GetNews(widget.source.id??'');
  }
  @override
  void didUpdateWidget(covariant NewsListWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    ViewModel.GetNews(widget.source.id??'');
  }
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(create: (context) =>ViewModel..GetNews(widget.source.id??'') ,
      child: Consumer<NewsViewModel>(builder: (context, NewsViewModel, child) {
        if(ViewModel.isLoading ){
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if(ViewModel.ErrorMassage !=null){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(ViewModel.ErrorMassage??''),
              ElevatedButton(
                  onPressed: () {
                    ViewModel.GetNews(widget.source.id??'');
                  },
                  child: Text("Try again")),
            ],
          );
        }
        var NewsList = ViewModel.articlesList;
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
      },),
    )
      ;
  }
}
