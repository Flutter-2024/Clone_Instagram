import 'package:flutter/material.dart';

import '../constants/source_string.dart';

class CustomChatSearchWidget extends StatefulWidget {
  const CustomChatSearchWidget({Key? key}) : super(key: key);

  @override
  State<CustomChatSearchWidget> createState() => _CustomChatSearchWidgetState();
}

class _CustomChatSearchWidgetState extends State<CustomChatSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {},
          leading: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          hintText: SourceString.search,
          hintStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              color: Colors.grey,
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.grey.shade200,
          ),
          elevation: MaterialStateProperty.all<double>(0.0),
          constraints: BoxConstraints(
            minHeight: 40.0,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller){
        return List<ListTile>.generate(10, (int index) {
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text("User $index"),
            subtitle: Text("User $index"),
            onTap: () {
              setState(() {
                controller.closeView("User $index");
              });
            },
          );
        });
      },
    );
  }
}