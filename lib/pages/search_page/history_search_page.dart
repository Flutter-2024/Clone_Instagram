import 'package:clone_instagram/constants/SourceString.dart';
import 'package:flutter/material.dart';

class HistorySearchPage extends SearchDelegate {
  List<String> list = ["nhay", "hat", "lien minh huyen thoai", "pam", "combo yasua", "di date mac gi", "meo dang yeu", "mua ba-le",
    "nhay", "hat", "lien minh huyen thoai", "pam", "combo yasua", "di date mac gi", "meo dang yeu", "mua ba-le"];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in list) {
      if(item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(var item in list) {
      if(item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return Column(
      children: [
        const SizedBox(height: 24.0),
        Row(
          children: [
            const SizedBox(width: 16.0),
            const Text(
              SourceString.recent,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500
              ),
            ),
            Expanded(child: Container()),
            const Text(
              SourceString.seeAll,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.blue
              ),
            ),
            const SizedBox(width: 16.0),
          ],
        ),
        const SizedBox(height: 24.0),
        Expanded(
          child: ListView.separated(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return _item(result);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 16.0,
                color: Colors.transparent,
              );
            },
          )
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }

  Widget _item(String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(200)),
            border: Border.all(color: Colors.grey, width: 1),
          ),
          child: const Icon(
            Icons.search,
            size: 40,
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
            ),
          )
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          child: const Icon(
            Icons.clear,
            color: Colors.grey,
            size: 18.0,
          ),
        )
      ],
    );
  }
  
}
