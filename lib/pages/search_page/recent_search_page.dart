import 'package:clone_instagram/constants/media_utils.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/data/data.dart';
import 'package:clone_instagram/model/person.dart';
import 'package:clone_instagram/pages/search_page/result_search_page.dart';
import 'package:flutter/material.dart';

class RecentSearchPage extends SearchDelegate {

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
    return ResultSearchPage(result: query.toLowerCase());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Person> matchQueryPerson = [];

    for(var item in DataPerson.listPerson) {
      if(item.nameInstagram.toLowerCase().contains(query.toLowerCase())) {
        matchQueryPerson.add(item);
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
            itemCount: matchQueryPerson.length,
            itemBuilder: (context, index) {
              var result = matchQueryPerson[index];
              return _itemPerson(result);
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

  Widget _itemText(String title) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 24.0),
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

  Widget _itemPerson(Person person) {
    return person.type == false ? Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: person.story == true ? BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.red, width: 2),
          ) : null,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  person.avatar,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              )
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                person.nameInstagram,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                )
              ),
              Text(
                person.nameFacebook,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                )
              ),
              if(person.follow != 0)...[
                Text(
                    "${person.follow} followers",
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                    )
                ),
              ]
            ],
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
    ) : _itemText(person.nameInstagram);
  }
  
}
