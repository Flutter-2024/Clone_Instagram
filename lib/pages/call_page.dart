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
      body: Center(
        child: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            if (NavigatorState().canPop()) {
                              Navigator.pop(context);
                            }
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back),
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.all(0.0),
                          iconSize: 30,
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          SourceString.call,
                          style: AppTextStyle.boldLargeTitle,
                        ),
                      ),
                    ],
                  ),
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
                    )
                  )
                ],
              ),
            )),
      ),
    );
  }
}
