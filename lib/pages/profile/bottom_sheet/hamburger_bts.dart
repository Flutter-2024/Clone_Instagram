import 'package:clone_instagram/data/list_item_hamburber.dart';
import 'package:flutter/material.dart';
import '../../../custom_widget/resize_handle_divider.dart';

class HamburgerBts extends StatelessWidget{
  const HamburgerBts({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: ItemHamburger.listHamburger.length,
        itemBuilder: (BuildContext context, int index){
          if(index == 0){
            return Column(
              children: [
                const ResizeHandleDivider(),
                _getHamburgerItem(ItemHamburger.listHamburger[index])
              ],
            );
          }
          else{
            return _getHamburgerItem(ItemHamburger.listHamburger[index]);
          }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(indent: 48,);
        },
      ),
    );
  }
  Widget _getHamburgerItem(ItemHamburger itemHamburger){
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(itemHamburger.name),
      leading: itemHamburger.icon,
     // trailing: itemHamburger.iconTrailing,
    );
  }

}