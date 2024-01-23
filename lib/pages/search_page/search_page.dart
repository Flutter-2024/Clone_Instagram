import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/pages/search_page/history_search_page.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: _search(context),
    );
  }

  Widget _body(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return Future<void>.delayed(const Duration(seconds: 2));
      },
      child: SingleChildScrollView(
        child: _grid(context),
      )
    );
  }

  Widget _search(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xffDCDCDC)
        ),
        child: const Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: Colors.black,
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              SourceString.search,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20
              ),
            )
          ],
        ),
      ),
      onTap: (){
        showSearch(
          context: context,
          delegate: HistorySearchPage()
        );
      },
    );
  }

  Widget _grid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0
        ),
        itemBuilder: (context, index) {
          return _item();
        },
      ),
    );
  }

  Widget _item() {
    return Stack(
      children: [
        Container(
          color: Colors.lightBlue,
          child: Image.asset(SourceString.urlTest),
        ),
        const Positioned(
          top: 5,
          right: 5,
          child: Icon(
            Icons.copy_outlined,
            color: Colors.white,
          )
        )
      ],
    );
  }

}
