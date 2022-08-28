import 'package:flutter/material.dart';
import 'package:netflix/assets.dart';
import 'package:netflix/widgets/responsiveness.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({this.scrollOffset = 0, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 24),
      child:
          const Responsive(desktop: _DesktopAppBar(), mobile: _MobileAppBar()),
    );
  }
}

class _MobileAppBar extends StatelessWidget {
  const _MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Image.asset(
            Assets.netflixLogo0,
          ),
        ),
        TextButton(
          onPressed: () => print('Tv Shows'),
          child: const Text(
            'TV Shows',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => print('Movies'),
          child: const Text(
            'Movies',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => print('My lIst'),
          child: const Text(
            'My List',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        )
      ]),
    );
  }
}

class _DesktopAppBar extends StatelessWidget {
  const _DesktopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: Image.asset(
            Assets.netflixLogo0,
          ),
        ),
        TextButton(
          onPressed: () => print('Home'),
          child: const Text(
            'Home',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => print('Tv Shows'),
          child: const Text(
            'Tv Shows',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => print('Movies'),
          child: const Text(
            'Movies',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => print('Latest'),
          child: const Text(
            'Latest',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => print('My List'),
          child: const Text(
            'My List',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () => print('search'),
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        TextButton(
          onPressed: () => print('KIDS'),
          child: const Text(
            'KIDS',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () => print('DVD'),
          child: const Text(
            'DVD',
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
            onPressed: () => print('Gift'),
            icon: const Icon(Icons.card_giftcard, color: Colors.white)),
        IconButton(
            onPressed: () => print('Notifications'),
            icon: const Icon(Icons.notifications, color: Colors.white)),
      ]),
    );
  }
}
