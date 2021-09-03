import 'package:flutter/material.dart';
import 'package:amine_elhoussaini/models/content.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:amine_elhoussaini/components/video.dart';

class ArticlePage extends StatelessWidget {
  final Content content;
  const ArticlePage({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget fileWidget = Text('');
    if (content.type == 'jpg' ||
        content.type == 'jpeg' ||
        content.type == 'png') {
      fileWidget = Image.network(content.file);
    } else if (content.type == "mp4") {
      fileWidget = MyVideo(video: content.file);
    }

    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              children: [
                /*2*/
                Container(
                  child: Text(
                    content.title,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue[900]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget textSection = Padding(
      padding: EdgeInsets.all(32),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Html(
          data: content.content,
        ),
      ),
    );

    return Scaffold(
      //extendBodyBehindAppBar: true, //for body enter the app bar
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(
          "عبد الرزاق المونفالوطي",
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          fileWidget,
          titleSection,
          textSection,
        ],
      )),
    );
  }
}
