import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../animation/scale_post_animation.dart';
import '../constants/source_string.dart';
import '../data/list_post.dart';

class OverlayEntryForPost extends StatelessWidget {
  OverlayEntryForPost({
    required this.url,
    required this.position,
    super.key,
  });
  final String url;
  final int position;
  OverlayEntry? _overlayEntry;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return GestureDetector(
        child: Image.network(url, fit: BoxFit.cover),
        onLongPress: () {
          _overlayEntry = _createOverlayEntry(url, position);
          Overlay.of(context).insert(_overlayEntry!);
        },
      );
    });
  }
  OverlayEntry _createOverlayEntry(String url, int position){
    return OverlayEntry(builder: (context) {
      return GestureDetector(
        onTap: () {
          _overlayEntry?.remove();
          // after remove overlay, we go to detail page
        },
        child: Container(
          color: Colors.black.withOpacity(0.8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ScaleTransitionPost(
            widget: FractionallySizedBox(
              heightFactor: 0.9,
              child: Center(
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
                        _createMenu(position),
                      ],
                    )
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
  Material _createPhotoTitle() => Material(
    child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(Post.imageUrls[0])
          ),
          title: const Text(
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
  Widget _getMenu(int position) {
    switch(position) {
      case 0:
        return _createMenuWithAlignment(Alignment.topLeft);
      case 1:
        return _createMenuWithAlignment(Alignment.center);
      case 2:
        return _createMenuWithAlignment(Alignment.topRight);
      default:
        return _createMenuWithAlignment(Alignment.topLeft);
    }
  }
  Widget _createMenuWithAlignment(Alignment alignment){
    return Align(
      alignment: alignment,
      child: FractionallySizedBox(
        widthFactor: 0.7,
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
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
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
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
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
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    trailing: FaIcon(FontAwesomeIcons.comment),
                    title: Text(SourceString.comment),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
