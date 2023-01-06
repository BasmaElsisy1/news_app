import 'package:flutter/material.dart';
import 'package:news/model/NewsRes.dart';
import 'package:url_launcher/url_launcher.dart';
import '../shared/styles/colors.dart';

class DetailsScreen extends StatelessWidget {
  static const String routename = 'newsDetails';
  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.transparent)),
        backgroundColor: greenColor,
        title: Container(
            // padding: EdgeInsets.only(left: 50),

            child: Text(
          'News Title',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
        )),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            article.description!,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: Color.fromRGBO(66, 80, 92, 1.0)),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    openURL(article.url);
                  },
                  child: Text(
                    'View Full Article',
                    style: TextStyle(color: blackColor),
                  )),
              Icon(
                Icons.arrow_right,
                color: blackColor,
              )
            ],
          )
        ]),
      ),
    );
  }

  void openURL(String? url) async {
    if (url == null) {
      return;
    }
    Uri url_new = Uri.parse(url);
    if (await canLaunchUrl(url_new)) {
      await launchUrl(url_new);
    }
  }
}
