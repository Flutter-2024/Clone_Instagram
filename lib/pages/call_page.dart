import 'package:clone_instagram/constants/app_text_style.dart';
import 'package:clone_instagram/constants/source_string.dart';
import 'package:clone_instagram/widgets/custom_call_item_widget.dart';
import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: SafeArea(
          child: _body(),
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leading: InkWell(
        onTap: () {
          if (NavigatorState().canPop()) {
            Navigator.pop(context);
          }
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Icon(
            Icons.arrow_back,
            size: 30,
          ),
        ),
      ),
      title: Text(
        SourceString.call,
        style: AppTextStyle.boldLargeTitle,
      ),
    );
  }
  Container _body() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SourceString.friendCall,
            style: AppTextStyle.boldMediumTitle,
            textAlign: TextAlign.start,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const CustomCallItemWidget(
                  fullName: SourceString.fullName,
                  username: SourceString.username,
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
