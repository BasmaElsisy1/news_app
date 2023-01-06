import 'package:flutter/material.dart';
import 'package:news/shared/styles/colors.dart';
import '../model/NewsRes.dart';
import '../screens/newsItem.dart';
import '../shared/network/remote/api_manager.dart';

class delegateClass extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(Icons.search, color: greenColor))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.clear, color: greenColor),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return  Expanded(
      child: FutureBuilder<NewsRes>(
          future: Api_manager.getNews(
            searchkeyword: query
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.hasError) {
              return Center(child: Text('There is an error'));
            }
            if (!snapshot.hasData) {
              print(snapshot.data?.message);
              return Center(child: Text('no data'));
            }
            if (snapshot.data!.status != 'ok') {
              return Center(child: Text(snapshot.data?.message ?? ''));
            }
            var articles = snapshot.data?.articles ?? [];
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.only(left: 10, right: 20),
                      child: NewsItem(articles[index]));
                },
                itemCount: articles.length,
              ),
            );
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('Suggestions'));
  }
}
