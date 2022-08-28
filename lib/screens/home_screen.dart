import 'package:flutter/material.dart';
import 'package:netflix/providers/provider.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';
import 'package:netflix/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _controller;
  double scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()
      ..addListener(() {
        setState(() {
          Provider.of<ScrollOffset>(context, listen: false)
              .updateOffset(_controller.offset);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.cast),
        onPressed: () => print('cast'),
      ),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 50.0),
          child: CustomAppBar(
              scrollOffset: Provider.of<ScrollOffset>(context, listen: true)
                  .offsetValue)),
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          const SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 10),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: const PageStorageKey('preveiws'),
                previewList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(contentList: myList, text: 'My List'),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('MyList'),
              contentList: originals,
              text: 'Netflix Originals',
              isOriginal: true,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
                key: const PageStorageKey('trending'),
                contentList: trending,
                text: 'Trending'),
          )
        ],
      ),
    );
  }
}
