import 'package:flutter/material.dart';
import 'package:news/model/NewsRes.dart';
import 'package:news/model/SourcesRes.dart';
import 'package:news/screens/newsItem.dart';
import 'package:news/screens/tabItem.dart';
import 'package:news/shared/network/remote/api_manager.dart';
import 'package:news/shared/styles/colors.dart';

class TabControllerTop extends StatefulWidget {
  List<Sources> sources;
  TabControllerTop(this.sources);

  @override
  State<TabControllerTop> createState() => _TabControllerTopState();
}

class _TabControllerTopState extends State<TabControllerTop> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 30, left: 10),
      child: Column(children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              onTap: ((value) {
                selectedIndex = value;
                setState(() {});
              }),
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources
                  .map((source) => TabItem(
                      source,
                      selectedIndex == widget.sources.indexOf(source)
                          ? true
                          : false))
                  .toList(),
            )),
        FutureBuilder<NewsRes>(
            future: Api_manager.getNews(widget.sources[selectedIndex].id!),
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
            })
      ]),
    );
  }
}
