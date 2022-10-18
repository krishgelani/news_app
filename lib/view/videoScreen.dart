import 'package:flutter/material.dart';
import 'package:news_app/provider/homeProvider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  VideoPlayerController? controller;
  int aappii = 0;

  List video = [
    "https://vod-progressive.akamaized.net/exp=1666037973~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1952%2F15%2F384761655%2F1618226607.mp4~hmac=1d03f05c6cef565139d6dca31b7de45e81f7027df586c95f33f7b74a3c2af458/vimeo-prod-skyfire-std-us/01/1952/15/384761655/1618226607.mp4",
    "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.network("${video[0]}");
    controller!.initialize().then((value) => setState((){}));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: video.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Provider.of<homeProvider>(context,listen: false).playpause();

                if(Provider.of<homeProvider>(context,listen: false).isplay==false)
                {
                  controller!.play();
                }
                else{
                  controller!.pause();
                }
              },
              child: VideoPlayer(controller!),
            );

          },
        ),
      ),
    );
  }
}
