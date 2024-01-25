


class ItemStory {
  String image;
  String name;

  ItemStory({required this.image, required this.name});

  static List<ItemStory> itemStories = [
    ItemStory(image: 'assets/alice.png', name: "Your Story"),
    ItemStory(image: 'assets/hellen.png', name: "Hellen"),
    ItemStory(image: 'assets/aya.jpg', name: "Aya"),
    ItemStory(image: 'assets/liliana.jpg', name: "Liliana"),
    ItemStory(image: 'assets/yue.jpg', name: "Yue"),
  ];
}
