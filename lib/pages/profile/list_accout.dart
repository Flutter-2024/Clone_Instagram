import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/SourceString.dart';

class ListAccount extends StatelessWidget{
   ListAccount({super.key});
  final List<ListTile> accounts = [
    ListTile(
      leading: Transform.scale(
          scale: 1.5,
          child: Image.asset("assets/images/avatar.png"))
      ,
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Transform.scale(
          scale: 1.5,
          child: Image.asset("assets/images/avatar.png"))
      ,
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Transform.scale(
          scale: 1.5,
          child: Image.asset("assets/images/avatar.png"))
      ,
      title: const Text(SourceString.userName),
    ),
    ListTile(
      leading: Container(
          decoration: BoxDecoration(
            color: Colors.green[50],
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(7.5),
          child: Image.asset("assets/images/add.png")
      ),
      title: const Text(SourceString.addNewAccount),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: ListView.separated(
        itemCount: accounts.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            child: accounts[index],
            onTap: (){

            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }

}