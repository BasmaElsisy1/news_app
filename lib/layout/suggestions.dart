// import 'package:flutter/material.dart';
// import 'package:news/layout/suggestion_item.dart';
// import 'package:news/model/NewsRes.dart';
// import 'package:news/model/SourcesRes.dart';
// import 'package:news/screens/newsItem.dart';
// import 'package:news/screens/tabItem.dart';
// import 'package:news/shared/network/remote/api_manager.dart';
// import 'package:news/shared/styles/colors.dart';
//
// class Suggesstions extends StatefulWidget {
//   List<Articles> articles;
//   Suggesstions(this.articles);
//
//   @override
//   State<Suggesstions> createState() => _TabControllerTopState();
// }
//
// class _TabControllerTopState extends State<Suggesstions> {
//   int selectedIndex = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 15, bottom: 30, left: 10),
//       child: Column(children: [
//         DefaultTabController(
//             length: widget.articles.length,
//             child: TabBar(
//               onTap: ((value) {
//                 selectedIndex = value;
//                 setState(() {});
//               }),
//               indicatorColor: Colors.transparent,
//               isScrollable: true,
//               tabs: widget.articles
//                   .map((source) => TabItemsugg(
//                   article))
//                   .toList(),
//             )),
//         FutureBuilder<NewsRes>(
//             future: Api_manager.getNews(widget.articles[index]),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Container(
//                     margin: EdgeInsets.symmetric(vertical: 20),
//                     child: Center(child: CircularProgressIndicator()));
//               }
//               if (snapshot.hasError) {
//                 return Center(child: Text('There is an error'));
//               }
//               if (!snapshot.hasData) {
//                 print(snapshot.data?.message);
//                 return Center(child: Text('no data'));
//               }
//               if (snapshot.data!.status != 'ok') {
//                 return Center(child: Text(snapshot.data?.message ?? ''));
//               }
//               var articles = snapshot.data?.articles ?? [];
//               return Expanded(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemBuilder: (context, index) {
//                     return Container(
//                         margin: EdgeInsets.only(left: 10, right: 20),
//                         child: NewsItem(articles[index]));
//                   },
//                   itemCount: articles.length,
//                 ),
//               );
//             })
//       ]),
//     );
//   }
// }
