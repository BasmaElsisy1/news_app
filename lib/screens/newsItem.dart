import 'package:flutter/material.dart';
import 'package:news/model/NewsRes.dart';
import 'package:news/screens/screen_details.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushNamed(DetailsScreen.routename, arguments: article),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            article.urlToImage ?? '',
            height: 230,
          ),
          Text(
            article.source?.name ?? '',
            style: TextStyle(
              fontSize: 10,
              color: Color.fromRGBO(121, 130, 139, 1.0),
            ),
          ),
          Text(
            article.title ?? '',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          Text(
            textAlign: TextAlign.end,
            article.publishedAt ?? '',
            style: TextStyle(
              fontSize: 13,
              color: Color.fromRGBO(121, 130, 139, 1.0),
            ),
          )
        ],
      ),
    );
  }
}
