import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/service/service.dart';
import 'package:flutter/material.dart';

import '../data/user.dart';
import '../utils/debouncer.dart';
import '../widgets/custom_new_chat_item_widget.dart';

class SearchChatPage extends StatefulWidget {
  const SearchChatPage({super.key});

  @override
  State<SearchChatPage> createState() => _SearchChatPageState();
}

class _SearchChatPageState extends State<SearchChatPage> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<User> _allUserList = [];
  List<User> _searchResultList = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Service.getUserList().then((userListFromServer) {
      setState(() {
        _allUserList = userListFromServer;
        _searchResultList = _allUserList;
      });
    });
  }

  Widget _buildUserList(List<User> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return CustomNewChatItemWidget(
          username: list[index].username,
          fullName: list[index].fullName,
        );
      },
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Expanded(
        child: _searchController.text.isEmpty
            ? _buildUserList(_allUserList)
            : _buildUserList(_searchResultList),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            title: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: AppTextStyle.normalMediumTitle.copyWith(
                  color: Colors.grey,
                ),
              ),
              onChanged: onSearchTextChanged,
            ),
            centerTitle: true,
          ),
          body: _buildBody(),
        ),
      ),
    );
  }

  void onSearchTextChanged(String text) async {
    _debouncer.run(() {
      setState(() {
        if (text.isEmpty) {
          _searchResultList = _allUserList;
        } else {
          _searchResultList = _allUserList
              .where((user) => (user.username.toLowerCase().contains(text.toLowerCase()) ||
                  user.fullName.toLowerCase().contains(text.toLowerCase())))
              .toList();
        }
      });
    });
  }
}
