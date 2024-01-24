import 'package:clone_instagram/constants/source_image.dart';
import 'package:clone_instagram/constants/source_string.dart';

class Highlight {
  String image;
  String title;

  Highlight({required this.image, required this.title});

  static List<Highlight> highlightItems = [
    Highlight(image: SourceImage.bike, title: SourceString.myBike),
    Highlight(image: SourceImage.cooking, title: SourceString.myCooking),
    Highlight(image: SourceImage.nature, title: SourceString.myNature),
    Highlight(image: SourceImage.pet, title: SourceString.myPet),
    Highlight(image: SourceImage.swimming, title: SourceString.myPool),
    Highlight(image: SourceImage.yoga, title: SourceString.myYoga),
  ];
}
