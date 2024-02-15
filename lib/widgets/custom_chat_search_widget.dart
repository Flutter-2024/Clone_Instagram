import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:flutter/material.dart';

import '../config/app_route.dart';
import '../constants/source_string.dart';

class CustomChatSearchWidget extends StatefulWidget {
  const CustomChatSearchWidget({super.key});

  @override
  State<CustomChatSearchWidget> createState() => _CustomChatSearchWidgetState();
}

class _CustomChatSearchWidgetState extends State<CustomChatSearchWidget> {

  @override
  void initState() {
    super.initState();
  }

  Widget _buildSearchBox() {
    return Card(
      elevation: 0.0,
      color: Colors.grey[200],
      child: Container(
        height: 40.0,
        padding: const EdgeInsets.all(8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 16.0),
                  child: Icon(Icons.search),
                ),
              ),
              Expanded(
                flex: 6,
                child: GestureDetector(
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
              ),
            ],
          ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: _buildSearchBox(),
      // resizeToAvoidBottomInset: false,
    );
  }
}
