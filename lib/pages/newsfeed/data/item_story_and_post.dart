


class ItemStoryAndPost {
  String imageAvatar;
  String name;
  String imagePost;
  bool isLike = false;
  bool isMark = false;

  ItemStoryAndPost({required this.imageAvatar, required this.name, required this.imagePost});

  static List<ItemStoryAndPost> itemStories = [
    ItemStoryAndPost(imageAvatar: 'assets/alice.png', name: "Your Story", imagePost: 'assets/post_alice.jpg'),
    ItemStoryAndPost(imageAvatar: 'assets/hellen.png', name: "Hellen", imagePost: 'assets/post_hellen.jpg'),
    ItemStoryAndPost(imageAvatar: 'assets/aya.jpg', name: "Aya", imagePost: 'assets/post_aya.jpg'),
    ItemStoryAndPost(imageAvatar: 'assets/liliana.jpg', name: "Liliana", imagePost: 'assets/post_liliana.jpg'),
    ItemStoryAndPost(imageAvatar: 'assets/yue.jpg', name: "Yue", imagePost: 'assets/post_telanas.jpg'),
  ];
}
