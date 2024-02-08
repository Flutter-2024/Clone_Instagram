import 'package:clone_instagram/constants/source_image.dart';

class Friend{
  String name;
  String image;
  String numberOfFollowers;
  Friend({required this.name, required this.image, required this.numberOfFollowers});
  static List<Friend> listFriend = [
    Friend(name: "Jonh", image: SourceImage.yoga, numberOfFollowers: "Có qweqweqweqwegqiwgeiuqwgeuqgwyuegjhqkwgehj10qwjgrbqhjwgrfhqgwfhqwhjfqhwujf0 người theo dõi"),
    Friend(name: "Jonh", image: SourceImage.yoga, numberOfFollowers: "Có 100 người theo dõi"),
    Friend(name: "Jonh", image: SourceImage.yoga, numberOfFollowers: "Có 100 người theo dõi"),
    Friend(name: "Jonh", image: SourceImage.yoga, numberOfFollowers: "Có 100 người theo dõi"),
    Friend(name: "Jonh", image: SourceImage.yoga, numberOfFollowers: "Có 100 người theo dõi"),
    Friend(name: "Jonh", image: SourceImage.yoga, numberOfFollowers: "Có 100 người theo dõi"),
    Friend(name: "Jonh", image: SourceImage.yoga, numberOfFollowers: "Có 100 người theo dõi"),
  ];
}