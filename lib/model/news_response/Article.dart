
import '../sources_response/Source.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : null
/// title : "Watch: Dragons v Bulls in the URC"
/// description : "Gêm fyw Pencampwriaeth Rygbi Unedig rhwng y Dreigiau a Vodacom Bulls. C/G 19.35. Live U..."
/// url : "https://www.bbc.co.uk/programmes/p0hhksm6"
/// urlToImage : "https://ichef.bbci.co.uk/images/ic/1200x675/p0gm7l5f.jpg"
/// publishedAt : "2024-03-23T21:40:00Z"
/// content : "Gêm fyw Pencampwriaeth Rygbi Unedig rhwng y Dreigiau a Vodacom Bulls. C/G 19.35. Live United Rugby Championship game between the Dragons and Vodacom Bulls. Rodney Parade, K/O 19.35."

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}