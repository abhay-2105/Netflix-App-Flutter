import 'package:flutter/material.dart';
import 'package:netflix/models/content_model.dart';
import 'package:netflix/widgets/responsiveness.dart';
import 'package:netflix/widgets/widgets.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  const ContentHeader({super.key, required this.featuredContent});
  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _DesktopContentHeader(featuredContent: featuredContent),
      mobile: MobileContentHeader(featuredContent: featuredContent),
    );
  }
}

class MobileContentHeader extends StatelessWidget {
  const MobileContentHeader({super.key, required this.featuredContent});
  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(featuredContent.imageUrl),
                ),
              ),
            ),
            Container(
              height: 500,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
            ),
            Positioned(
              bottom: 110,
              child: SizedBox(
                  width: 250,
                  child: Image.asset(featuredContent.titleImageUrl!)),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VerticalIcon(
                        icon: Icons.add,
                        text: 'List',
                        onTap: () {
                          print('List');
                        }),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: ElevatedButton.icon(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.white),
                          onPressed: () => print('play Button'),
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                            size: 30,
                          ),
                          label: const Text('Play',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600))),
                    ),
                    VerticalIcon(
                        icon: Icons.info_outline,
                        text: 'info',
                        onTap: () {
                          print('info');
                        })
                  ],
                ))
          ],
        )
      ],
    );
  }
}

class _DesktopContentHeader extends StatefulWidget {
  final Content featuredContent;
  const _DesktopContentHeader({super.key, required this.featuredContent});

  @override
  State<_DesktopContentHeader> createState() => _DesktopContentHeaderState();
}

class _DesktopContentHeaderState extends State<_DesktopContentHeader> {
  late VideoPlayerController _videoPlayerController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(widget.featuredContent.videoUrl!)
          ..initialize().then((_) {
            setState(() {});
          })
          ..setVolume(0)
          ..play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoPlayerController.value.isPlaying
          ? _videoPlayerController.pause()
          : _videoPlayerController.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: _videoPlayerController.value.isInitialized
                ? _videoPlayerController.value.aspectRatio
                : 2.334,
            child: _videoPlayerController.value.isInitialized
                ? VideoPlayer(_videoPlayerController)
                : Image.asset(
                    widget.featuredContent.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: AspectRatio(
              aspectRatio: _videoPlayerController.value.isInitialized
                  ? _videoPlayerController.value.aspectRatio
                  : 2.334,
              child: Container(
                height: 500,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            left: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250,
                  child: Image.asset(widget.featuredContent.titleImageUrl!),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  widget.featuredContent.description!,
                  style: const TextStyle(color: Colors.white, shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 2,
                        offset: Offset(2, 4))
                  ]),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () => print('play Button'),
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: const Text(
                      'Play',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: () => print('More Info'),
                    icon: const Icon(
                      Icons.play_arrow,
                      color: Colors.black,
                      size: 30,
                    ),
                    label: const Text(
                      'More Info',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  if (_videoPlayerController.value.isInitialized)
                    IconButton(
                      icon: Icon(
                        _isMuted ? Icons.volume_off : Icons.volume_up,
                      ),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () => setState(() {
                        _isMuted
                            ? _videoPlayerController.setVolume(100)
                            : _videoPlayerController.setVolume(0);
                        _isMuted = _videoPlayerController.value.volume == 0;
                      }),
                    ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
