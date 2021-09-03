//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:amine_elhoussaini/models/content.dart';
//import 'package:amine_elhoussaini/components/video.dart';
import 'package:amine_elhoussaini/screens/article.dart';
import 'package:amine_elhoussaini/components/video_frame.dart';

class ContentCard1 extends StatefulWidget {
  final Content content;
  int index;
  Function(int) callback;
  ContentCard1(
      {Key? key,
      required this.content,
      required this.index,
      required this.callback})
      : super(key: key);

  @override
  _ContentCard1State createState() => _ContentCard1State();
}

class _ContentCard1State extends State<ContentCard1> {
  @override
  Widget build(BuildContext context) {
    Widget fileWidget = Text('');
    Widget seeMoreWidget = SizedBox();

    if (widget.content.type == 'jpg' ||
        widget.content.type == 'jpeg' ||
        widget.content.type == 'png') {
      fileWidget = InteractiveViewer(
          child: Image.network(widget.content.file, loadingBuilder:
              (context, child, progress) {
        if (progress == null) {
          //print(widget.index);
          widget.callback(widget.index);
          return child;
        } else {
          return LinearProgressIndicator();
        }
        //return progress == null ? child : LinearProgressIndicator();
      }, errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
        widget.callback(widget.index);
        return Text("حدث خطأ في الصورة");
      }));
    } else if (widget.content.type == "mp4") {
      fileWidget = VideoFrame(
        video: widget.content.file,
        index: widget.index,
        callback: widget.callback,
      );
    }

    if (widget.content.name == "article") {
      seeMoreWidget = TextButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => ArticlePage(content: widget.content)),
          );
        },
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.cyan,
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('معرفة المزيد'),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.01,
            blurRadius: 9,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
            child: Column(
          children: [
            Text(
              widget.content.title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue[900]),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8, top: 8),
              child: fileWidget,
            ),
            seeMoreWidget
          ],
        )),
      ),
    );
  }
}

///
///
///
///
class ContentCard extends StatelessWidget {
  final Content content;
  ContentCard({
    Key? key,
    required this.content,
  }) : super(key: key);

  Widget build(BuildContext context) {
    Widget fileWidget = Text('');
    Widget seeMoreWidget = SizedBox();

    if (content.type == 'jpg' ||
        content.type == 'jpeg' ||
        content.type == 'png') {
      fileWidget = InteractiveViewer(
          child: Image.network(content.file, loadingBuilder:
              (context, child, progress) {
        if (progress == null) {
          return child;
        } else {
          return LinearProgressIndicator();
        }
        //return progress == null ? child : LinearProgressIndicator();
      }, errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Text("حدث خطأ في الصورة");
      }));
    } else if (content.type == "mp4") {
      //fileWidget = VideoFrame(video: content.file);
    }

    if (content.name == "article") {
      seeMoreWidget = TextButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => ArticlePage(content: content)),
          );
        },
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.cyan,
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Text('معرفة المزيد'),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.01,
            blurRadius: 9,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
            child: Column(
          children: [
            Text(
              content.title,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.blue[900]),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 8, top: 8),
              child: fileWidget,
            ),
            seeMoreWidget
          ],
        )),
      ),
    );
  }
}
