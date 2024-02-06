import 'package:flutter/material.dart';
import '../../data/list_account.dart';

class AccountApp extends StatelessWidget{
  const AccountApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: ListView.separated(
        itemCount: Account.listAccount.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index){
          return GestureDetector(
            child: _getAccountItem(Account.listAccount[index]),
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
  Widget _getAccountItem( Account account){
    return ListTile(
        leading: Transform.scale(
          scale: 1.5, child: Image.asset(account.avatar)),
          title: Text(account.userName),
    );
  }


}