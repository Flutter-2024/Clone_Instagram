
import 'package:flutter/material.dart';

import '../../data/list_highligt.dart';

class HighlightStories extends StatelessWidget{
  const HighlightStories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: Highlight.highlightItems.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        backgroundImage:
                        AssetImage(Highlight.highlightItems[index].image),
                        radius: 28,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      Highlight.highlightItems[index].title,
                      style: const TextStyle(fontSize: 13),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              )
            ],
          );
        },
      ),
    );
  }

}