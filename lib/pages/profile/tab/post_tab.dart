import 'package:flutter/material.dart';
import '../../../constants/source_string.dart';
import '../../../data/list_post.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PostTab extends StatelessWidget {
  PostTab({super.key});

  late OverlayEntry _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        children: Post.imageUrls.map(_createGridTileWidget).toList(),
      ),
    );
  }
  Widget _createGridTileWidget(String url) => Builder(builder: (context) {
        return GestureDetector(
          child: Image.network(url, fit: BoxFit.cover),
          onLongPress: () {
            _overlayEntry = _createOverlayEntry(url);
            Overlay.of(context).insert(_overlayEntry);
          },
          onLongPressEnd: (details) {

          },
        );
      });
  OverlayEntry _createOverlayEntry(String url) =>
      OverlayEntry(builder: (context) {
        return GestureDetector(
          onTap: () {
            _overlayEntry.remove();
            // after remove overlay, we go to detail page
          },
          child: Container(
            color: Colors.black.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: ClipRRect(
                // padding: const EdgeInsets.symmetric(horizontal: 16),
                  borderRadius: BorderRadius.circular(20),
                  child: ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(0),
                    children: [
                      _createPhotoTitle(),
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: 420,
                            maxWidth: MediaQuery.of(context).size.width,
                          ),
                          // decoration: const BoxDecoration(
                          //   borderRadius: BorderRadius.only(
                          //     bottomLeft: Radius.circular(20),
                          //     bottomRight: Radius.circular(20),
                          //   ),
                          //   color: Colors.white,
                          // ),
                          child: Image.network(
                            url,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Container(
                        height: 16,
                        color: Colors.transparent
                      ),
                       _createMenu(),
                    ],
                  )
              ),
            ),
          ),
        );
      });

  Material _createPhotoTitle() => Material(
    child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: const ListTile(
          leading: CircleAvatar(
            radius: 12,
            backgroundImage: AssetImage('assets/images/cooking.jpg'),
          ),
          title: Text(
            SourceString.userName,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        )),
  );

  Material _createMenu() => Material(
    color: Colors.transparent,
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
        Expanded(
          flex: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                children: [
                  InkWell(
                    child: const ListTile(
                      trailing: Icon(Icons.favorite_border_outlined),
                      title: Text(SourceString.like),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: const ListTile(
                      trailing: FaIcon(FontAwesomeIcons.paperPlane),
                      title: Text(SourceString.share),
                    ),
                    onTap: () {},
                  ),
                  InkWell(
                    child: const ListTile(
                      trailing: FaIcon(FontAwesomeIcons.comment),
                      title: Text(SourceString.comment),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
