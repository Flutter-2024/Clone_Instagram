import '../constants/source_image.dart';
import '../constants/source_string.dart';

class ItemPost{
  String name;
  String image;

  ItemPost({required this.name, required this.image});

  static List<ItemPost> listItemPost = [
    ItemPost(name: SourceString.footage, image: SourceImage.film),
    ItemPost(name: SourceString.footage, image: SourceImage.post),
    ItemPost(name: SourceString.news, image: SourceImage.add),
    ItemPost(name: SourceString.newsHot, image: SourceImage.heart),
    ItemPost(name: SourceString.live, image: SourceImage.heart),
    ItemPost(name: SourceString.forYou, image: SourceImage.heart),
  ];
}
