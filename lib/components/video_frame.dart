import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:amine_elhoussaini/screens/play_video.dart';

class VideoFrame extends StatefulWidget {
  final String video;
  int index;
  Function(int) callback;
  VideoFrame(
      {Key? key,
      required this.video,
      required this.index,
      required this.callback})
      : super(key: key);

  @override
  _VideoFrameState createState() => _VideoFrameState();
}

class _VideoFrameState extends State<VideoFrame> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video);

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Future.delayed(Duration.zero, () async {
              //print(widget.index);
              widget.callback(widget.index);
            });
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => PlayVideo(video: widget.video)),
                );
              },
              child: Container(
                //height: 200,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    Align(
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Icon(Icons.play_arrow),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
