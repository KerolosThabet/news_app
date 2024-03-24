import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app/model/news_response/Article.dart';

class NewsItem extends StatelessWidget {
  Article article;

  NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage ?? '',
            height: height * .2,
            width: double.infinity,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Text(article.source?.name ?? ''),
        Text(article.title ?? ""),
        Align(
            alignment: Alignment.centerRight,
            child: Text(article.publishedAt ?? '')),
      ],
    );
  }
}
