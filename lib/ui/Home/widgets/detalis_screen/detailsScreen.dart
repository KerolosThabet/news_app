import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/news_response/Article.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  static const String route = "DetailsScreen";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Article;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/Background.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text("News App"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage ?? '',
                height: MediaQuery.of(context).size.height * .2,
                width: double.infinity,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 20,),
            Text(args.source?.name ?? ''),
            SizedBox(height: 10,),
            Text(args.title ?? ""),
            SizedBox(height: 10,),
            Align(
                alignment: Alignment.centerRight,
                child: Text(args.publishedAt ?? '')),
            SizedBox(height: 20,),
            Text(args.content ?? ""),
            SizedBox(height: 40,),
            InkWell(
              onTap: () {
                Uri url = Uri.parse(args.url??'');
                _launchUrl(url);
              },
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('View full article',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        )),
      ),
    );
  }
  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
