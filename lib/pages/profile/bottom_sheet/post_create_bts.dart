import 'package:clone_instagram/custom_widget/text_style_custom.dart';
import 'package:clone_instagram/data/list_item_post.dart';
import 'package:flutter/material.dart';

import '../../../constants/source_string.dart';
import '../../../custom_widget/resize_handle_divider.dart';

class PostCreateBts extends StatelessWidget {
  const PostCreateBts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        itemCount: ItemPost.listItemPost.length,
        itemBuilder: (BuildContext context, int index) {
         if(index == 0){
           return Column(
             children: [
               const ResizeHandleDivider(),
               const SizedBox(
                 height: 10,
               ),
               Text(
                 SourceString.create,
                 style: TextStyleCustom.instance.textStyleBold(),
                 textAlign: TextAlign.center,
               ),
               const Divider(),
               _getTypeCreate(ItemPost.listItemPost[index])
             ],
           );
         }
         else {
           return _getTypeCreate(ItemPost.listItemPost[index]);
         }
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            indent: 48,
          );
        },
      ),
    );
  }
  ListTile _getTypeCreate(ItemPost itemPost) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(itemPost.name),
      leading: Image.asset(itemPost.image),
    );
  }
}
