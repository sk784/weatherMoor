
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({Key key}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  var videoList = [
    'assets/trim1.mp4',
    'assets/trim2.mp4',
    'assets/trim3.mp4'
  ];
  int index = 0;


  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      videoList.elementAt(index),
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: VideoPlayer(_controller),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                                _controller.play();
                            });
                          },
                          child: Icon(
                            Icons.play_arrow,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                                _controller.pause();
                            });
                          },
                          child: Icon(
                            Icons.pause,
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            if(index < videoList.length - 1){
                              index++;
                            } else {
                              index = 0;
                            }
                            final controller = VideoPlayerController.asset(videoList.elementAt(index));
                            final old = _controller;
                            _controller = controller;
                            if (old != null) {
                               old.pause();
                            }
                            setState(() {
                            });
                            controller
                              ..initialize().then((_) {
                                old?.dispose();
                                controller.play();
                                setState(() {});
                              });
                          },
                          child: Icon(
                           Icons.navigate_next,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}