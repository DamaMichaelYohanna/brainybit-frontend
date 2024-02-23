import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  final String videoId;
  const YoutubePlayerScreen({super.key, required this.videoId});

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {
// To control the youtube video functionality
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    late final videoId = widget.videoId;
    // TO load a video by its unique id
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          // Youtube player as widget
          child: YoutubePlayer(
            controller: _controller, // Controler that we created earlier
            aspectRatio: 16 / 9, // Aspect ratio you want to take in screen
            showVideoProgressIndicator: true,
          ),
        ),
      ),
    );
  }
}
