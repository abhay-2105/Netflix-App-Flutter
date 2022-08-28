import 'package:flutter/material.dart';
import 'package:netflix/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String text;
  final List<Content> contentList;
  final bool isOriginal;
  const ContentList(
      {required this.text,
      required this.contentList,
      this.isOriginal = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      SizedBox(
        height: isOriginal ? 400 : 220,
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: contentList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => print(contentList[index].name),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  // height: 200,
                  width: isOriginal ? 200 : 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(contentList[index].imageUrl),
                    ),
                  ),
                ),
              );
            }),
      ),
    ]);
  }
}
