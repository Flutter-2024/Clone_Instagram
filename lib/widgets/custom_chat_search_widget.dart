import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/widgets/custom_new_chat_item_widget.dart';
import 'package:flutter/material.dart';

import '../config/app_route.dart';
import '../constants/source_string.dart';
import '../service/service.dart';
import '../data/user.dart';
import '../utils/debouncer.dart';

class CustomChatSearchWidget extends StatefulWidget {
  const CustomChatSearchWidget({Key? key}) : super(key: key);

  @override
  State<CustomChatSearchWidget> createState() => _CustomChatSearchWidgetState();
}

class _CustomChatSearchWidgetState extends State<CustomChatSearchWidget> {
  // @override
  // Widget build(BuildContext context) {
  //   return SearchAnchor(
  //     builder: (BuildContext context, SearchController controller) {
  //       return SearchBar(
  //         controller: controller,
  //         onTap: () {
  //           controller.openView();
  //         },
  //         onChanged: (_) {},
  //         leading: const Icon(
  //           Icons.search,
  //           color: Colors.grey,
  //         ),
  //         padding: const MaterialStatePropertyAll<EdgeInsets>(
  //             EdgeInsets.symmetric(horizontal: 16.0)),
  //         hintText: SourceString.search,
  //         hintStyle: MaterialStateProperty.all<TextStyle>(
  //           const TextStyle(
  //             color: Colors.grey,
  //           ),
  //         ),
  //         backgroundColor: MaterialStateProperty.all<Color>(
  //           Colors.grey.shade200,
  //         ),
  //         elevation: MaterialStateProperty.all<double>(0.0),
  //         constraints: BoxConstraints(
  //           minHeight: 40.0,
  //           maxWidth: MediaQuery.of(context).size.width,
  //         ),
  //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //           RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //         ),
  //       );
  //     },
  //     suggestionsBuilder: (BuildContext context, SearchController controller){
  //       return List<CustomNewChatItemWidget>.generate(10, (int index) {
  //         return const CustomNewChatItemWidget(username: "", fullName: "Full",);
  //       });
  //     },
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSearchBox() {
    return Card(
      elevation: 0.0,
      color: Colors.grey[200],
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 16.0),
                child: Icon(Icons.search),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoute.searchChat);
                },
                child: Text(
                  SourceString.search,
                  style: AppTextStyle.normalMediumTitle.copyWith(
                    color: Colors.grey,
                  )
                ),
              ),
            ],
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSearchBox(),
      resizeToAvoidBottomInset: false,
    );
  }
}
