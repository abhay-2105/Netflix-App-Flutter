import 'package:flutter/material.dart';
import 'package:netflix/models/content_model.dart';

class Previews extends StatelessWidget {
  final List<Content> previewList;
  const Previews({required this.previewList, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
          child: Text(
            'Previews',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 165,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  print(previewList[index].name);
                },
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            previewList[index].imageUrl,
                          ),
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: previewList[index].color!, width: 4.0),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Colors.black87,
                            Colors.black45,
                            Colors.transparent,
                          ],
                          stops: [0, 0.25, 1],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: previewList[index].color!, width: 4.0),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 20,
                      child: Image.asset(previewList[index].titleImageUrl!),
                    )
                  ],
                ),
              );
            },
            itemCount: previewList.length,
          ),
        )
      ],
    );
  }
}
