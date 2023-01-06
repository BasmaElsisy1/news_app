import 'package:flutter/material.dart';
import 'package:news/model/category.dart';
import 'package:news/screens/tabController.dart';

import '../model/SourcesRes.dart';
import '../shared/network/remote/api_manager.dart';

class HomeScreen extends StatelessWidget {
  Category category;
  HomeScreen(this.category);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesRes>(
      future: Api_manager.getSources(category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasError) {
          return Center(child: Text('There is an error'));
        }
        if (snapshot.data!.status != 'ok') {
          return Center(child: Text(snapshot.data?.message ?? ''));
        }
        var sources = snapshot.data?.sources ?? [];
        // return Expanded(
        //   child: ListView.builder(
        //     itemBuilder: (context, index) {
        //       return Text(sources[index].name ?? '');
        //     },
        //     itemCount: sources.length,
        //   ),
        // );
        return TabControllerTop(sources);
      },
    );
  }
}
