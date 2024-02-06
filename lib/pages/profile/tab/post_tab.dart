import 'package:clone_instagram/animation/scale_post_animation.dart';
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
        children: Post.imageUrls.map((url) {
          final int idx = Post.imageUrls.indexOf(url) % 3;
          return _createGridTileWidget(url, idx);
        }).toList()
      ),
    );
  }
  Widget _createGridTileWidget(String url, int idx) => Builder(builder: (context) {
        return GestureDetector(
          child: Image.network(url, fit: BoxFit.cover),
          // child: Image.asset(SourceImage.bike, fit: BoxFit.cover),
          onLongPress: () {
            _overlayEntry = _createOverlayEntry(url, idx);
            Overlay.of(context).insert(_overlayEntry);
          },
          onLongPressEnd: (details) {

          },
        );
      });
  OverlayEntry _createOverlayEntry(String url, int idx) =>
      OverlayEntry(builder: (context) {
        return GestureDetector(
          onTap: () {
            _overlayEntry.remove();
            // after remove overlay, we go to detail page
          },
          child: Container(
            color: Colors.black.withOpacity(0.8),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ScaleTransitionPost(
              widget: Center(
                child: ClipRRect(
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
                         _createMenu(idx),
                      ],
                    )
                ),
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

  Material _createMenu(int idx) => Material(
    color: Colors.transparent,
    child: _getMenu(idx),
  );
  // ugly code
  Row _getMenu(int idx) {
    switch (idx) {
      case 0:
        return _createMenu0();
      case 1:
        return _createMenu1();
      case 2:
        return _createMenu2();
      default:
        return _createMenu0();
    }
  }
  // ugly code
  Row _createMenu2(){
    return Row(
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
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: Icon(Icons.favorite_border_outlined),
                      title: Text(SourceString.like),
                    ),
                  ),
                  TextButton(
                    onPressed: () {  },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: FaIcon(FontAwesomeIcons.paperPlane),
                      title: Text(SourceString.share),
                    ),
                  ),
                  TextButton(
                    onPressed: () {  },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: FaIcon(FontAwesomeIcons.comment),
                      title: Text(SourceString.comment),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
  // ugly code
  Row _createMenu0(){
    return Row(
      children: [
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
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: Icon(Icons.favorite_border_outlined),
                      title: Text(SourceString.like),
                    ),
                  ),
                  TextButton(
                    onPressed: () {  },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: FaIcon(FontAwesomeIcons.paperPlane),
                      title: Text(SourceString.share),
                    ),
                  ),
                  TextButton(
                    onPressed: () {  },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: FaIcon(FontAwesomeIcons.comment),
                      title: Text(SourceString.comment),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  // ugly code
  Row _createMenu1(){
    return Row(
      children: [
        Expanded(
          flex: 1,
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
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: Icon(Icons.favorite_border_outlined),
                      title: Text(SourceString.like),
                    ),
                  ),
                  TextButton(
                    onPressed: () {  },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: FaIcon(FontAwesomeIcons.paperPlane),
                      title: Text(SourceString.share),
                    ),
                  ),
                  TextButton(
                    onPressed: () {  },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                    child: const ListTile(
                      trailing: FaIcon(FontAwesomeIcons.comment),
                      title: Text(SourceString.comment),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
