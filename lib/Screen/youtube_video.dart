import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideo extends StatefulWidget {
  const YoutubeVideo({super.key});

  @override
  State<YoutubeVideo> createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'iLnmTe5Q2Qw',
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: YoutubePlayer(
              controller: _controller,
            )));
  }
}
