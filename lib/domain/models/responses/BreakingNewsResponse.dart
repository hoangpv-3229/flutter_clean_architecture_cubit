import 'Articles.dart';

class BreakingNewsResponse {
  BreakingNewsResponse({
      this.status, 
      this.totalResults, 
      this.articles,});

  factory BreakingNewsResponse.fromJson(dynamic json) {
    List<Article> articlesTemp = [];
    if (json['articles'] != null) {
      json['articles'].forEach((v) {
        articlesTemp.add(Article.fromJson(v));
      });
    }
    return BreakingNewsResponse(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: articlesTemp
    );
  }

  String? status;
  int? totalResults;
  List<Article>? articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['totalResults'] = totalResults;
    if (articles != null) {
      map['articles'] = articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}