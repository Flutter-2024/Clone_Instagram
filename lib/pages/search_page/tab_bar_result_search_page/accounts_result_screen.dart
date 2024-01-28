import 'package:clone_instagram/data/data.dart';
import 'package:clone_instagram/model/person.dart';
import 'package:flutter/material.dart';

class AccountsResultScreen extends StatefulWidget {
  const AccountsResultScreen({super.key});

  @override
  State<AccountsResultScreen> createState() => _AccountsResultScreenState();
}

class _AccountsResultScreenState extends State<AccountsResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: DataPerson.listPerson.length,
        itemBuilder: (context, index) {
          return _itemPerson(DataPerson.listPerson[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0.0,
            color: Colors.transparent,
          );
        },
      ),
    );
  }

  Widget _itemPerson(Person person) {
    return person.type == false ? Row(
      children: [
        Container(
          decoration: person.story == true ? BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.red, width: 2),
          ) : null,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
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
        const SizedBox(width: 16.0),
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
      ],
    ) : Container();
  }
}
