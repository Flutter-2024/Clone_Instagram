class Highlight {
  String image;
  String title;

  Highlight({required this.image, required this.title});

  static List<Highlight> highlightItems = [
    Highlight(image: 'assets/images/bike.jpg', title: "My Bike 🏍"),
    Highlight(image: 'assets/images/cooking.jpg', title: "Cooking 🔪"),
    Highlight(image: 'assets/images/nature.jpg', title: "Nature 🏞"),
    Highlight(image: 'assets/images/pet.jpg', title: "Pet ❤️"),
    Highlight(image: 'assets/images/swimming.jpg', title: "Pool 🌊"),
    Highlight(image: 'assets/images/yoga.jpg', title: "Yoga 💪🏻"),
  ];
}
