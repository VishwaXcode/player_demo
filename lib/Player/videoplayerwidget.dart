import 'package:flutter/material.dart';
import 'package:player_demo/ModelClasses/playListModel.dart';
import 'package:player_demo/Player/constant.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_hls_parser/flutter_hls_parser.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  List<PlayListModel> playListUrl = [];
  List<DropdownMenuItem<int>> resolutionItems = [];
  int playVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(AppConstantValues.playlistUri));
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.play();
      setState(() {});
    });
    getHLSPlayList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Player')),
      body: Column(children: [
        FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (contaxt, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        Container(
          color: const Color.fromARGB(255, 183, 153, 151),
          padding: const EdgeInsets.only(top: 5,bottom: 5),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  // Wrap the play or pause in a call to `setState`. This ensures the
                  // correct icon is shown.
                  setState(() {
                    // If the video is playing, pause it.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                },
                // Display the correct icon depending on the state of the player.
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
              DropdownButton<int>(
                items: resolutionItems,
                value: playVideoIndex,
                onChanged: (value) {
                  playHLSvideo(value!, _controller.value.position);
                },
              ),
            ],
          ),
        )
      ]),
    );
  }

  getHLSPlayList() async {
    final playList = await HlsPlaylistParser.create().parseString(
        Uri.parse(AppConstantValues.playlistUri),
        AppConstantValues.sampleMaster);
    playList as HlsMasterPlaylist;
    final mediaPlaylistUrls = playList.variants;
    for (Variant obj in mediaPlaylistUrls) {
      var format = obj.format;
      var height = format.height;
      var width = format.width;
      var url = obj.url;
      if (height != null) {
        if (playListUrl
            .every((item) => item.resolutionStr != ('$width X $height'))) {
          playListUrl
              .add(PlayListModel(url, height.toString(), width.toString(), ('$width X $height')));
        }
      }
    }
    createResolutionDropDown();
    playHLSvideo(playVideoIndex, Duration.zero);
  }

  createResolutionDropDown() {
    resolutionItems = List.generate(
      playListUrl.length,
      (i) => DropdownMenuItem(
        value: i,
        child: Text(playListUrl[i].resolutionStr!),
      ),
    );
  }

  playHLSvideo(int selectedIndex, Duration position) {
    PlayListModel playListObj = playListUrl[selectedIndex];
    _controller = VideoPlayerController.networkUrl(playListObj.url!);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.seekTo(position);
      _controller.play();
      //_controller.setLooping(true);
      setState(() {
        playVideoIndex = selectedIndex;
      });
    });
  }
}
