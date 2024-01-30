import 'package:clone_instagram/model/audio_result.dart';
import 'package:clone_instagram/model/person.dart';
import 'package:clone_instagram/model/reels.dart';
import 'package:clone_instagram/model/tags.dart';

class DataPerson {
  static List<Person> listPerson = [
    Person(type: false, avatar: 'assets/image/_mdunggg_.jpg', follow: 0, story: true, nameInstagram: '_mdunggg_', nameFacebook: 'Dũng Hoàng'),
    Person(type: false, avatar: 'assets/image/avt_null.jpg', follow: 0, story: false, nameInstagram: 'lordier.', nameFacebook: 'Hai Nguyen'),
    Person(type: false, avatar: 'assets/image/hieu_lew.jpg', follow: 20000, story: true,nameInstagram: 'hieu_lew', nameFacebook: 'Hiếu Lưu'),
    Person(type: true, avatar: 'assets/image/hieu_lew.jpg', follow: 20000, story: true,nameInstagram: 'pam', nameFacebook: 'Hiếu Lưu'),
    Person(type: true, avatar: 'assets/image/hieu_lew.jpg', follow: 20000, story: true,nameInstagram: 'dung', nameFacebook: 'Hiếu Lưu'),
    Person(type: false, avatar: 'assets/image/nickken.jpg', follow: 2000, story: true,nameInstagram: 'nickken.253', nameFacebook: 'Hoàng Anh Đinh'),
    Person(type: false, avatar: 'assets/image/demigod243.jpg', follow: 0, story: false,nameInstagram: 'demigod243', nameFacebook: 'Lê Trọng Đạt'),
    Person(type: true, avatar: 'assets/image/hieu_lew.jpg', follow: 20000, story: true,nameInstagram: 'combo yasua', nameFacebook: 'Hiếu Lưu'),
    Person(type: false, avatar: 'assets/image/meix.jpg', follow: 0, story: false,nameInstagram: 'meix_sensei', nameFacebook: 'Linh Mỹ'),
    Person(type: true, avatar: 'assets/image/hieu_lew.jpg', follow: 20000, story: true,nameInstagram: 'hieu', nameFacebook: 'Hiếu Lưu'),
    Person(type: false, avatar: 'assets/image/avt_null.jpg', follow: 0, story: false, nameInstagram: 'mhn.inel_', nameFacebook: 'Minh Anh'),
    Person(type: false, avatar: 'assets/image/dminh.jpg', follow: 0, story: false,nameInstagram: '_ndm_ndm_', nameFacebook: 'Nguyễn Đăng Minh'),
    Person(type: false, avatar: 'assets/image/nminh.jpg', follow: 100, story: true,nameInstagram: 'nguyetminh2102', nameFacebook: 'Đặng Nguyệt Minh'),
    Person(type: false, avatar: 'assets/image/pam.jpg', follow: 0, story: false,nameInstagram: 'pamyeuoi', nameFacebook: 'Pamela Hải Đường '),
  ];
}

class DataTags {
  static List<Tags> listTags = [
    Tags(tag: "#trung", posts: '19.5K'),
    Tags(tag: "#trungquoc", posts: '129.5K'),
    Tags(tag: "#trungthu", posts: '139.5K'),
    Tags(tag: "#trunggiayda", posts: '2tr+'),
    Tags(tag: "#trungdaigia", posts: '13Tr'),
    Tags(tag: "#trungkhanh", posts: '5K'),
    Tags(tag: "#trungquan", posts: '1K'),
    Tags(tag: "#trungtam", posts: '9.5K'),
    Tags(tag: "#trungsneaker", posts: '3K'),
    Tags(tag: "#trungquoc2", posts: '1K'),
    Tags(tag: "#trungquoc3", posts: '1.2K'),
  ];
}

class DataPlaces {
  static List<String> listPlaces = [
    "Trung Khanh", "Trung Khanh, Trung Quoc", "Trung Dong", "Central", "Hai Nam, Trung Quoc", "Bac Kinh, Trung Quoc ", "Thuong Hai, Trung Quoc ", "Trung One", "Trung Two", "Trung Three", "Trung Four"
  ];
}

class DataAudio {
  static List<AudioResult> listAudio = [
    AudioResult(avatar: 'assets/image/audio_01.jpg', name: "Loi choi 1", author: "Wren Evans", reels: "1314"),
    AudioResult(avatar: 'assets/image/audio_02.jpg', name: "Loi choi 2", author: "Wren Evans", reels: "134"),
    AudioResult(avatar: 'assets/image/audio_03.jpg', name: "Tri kỉ", author: "Phan Mạnh Quỳnh", reels: "5K+"),
    AudioResult(avatar: 'assets/image/audio_04.jpg', name: "Anh đã ổn hơn", author: "MCK", reels: "2K+"),
    AudioResult(avatar: 'assets/image/audio_01.jpg', name: "Loi choi 1", author: "Wren Evans", reels: "1314"),
    AudioResult(avatar: 'assets/image/audio_02.jpg', name: "Loi choi 2", author: "Wren Evans", reels: "134"),
    AudioResult(avatar: 'assets/image/audio_03.jpg', name: "Tri kỉ", author: "Phan Mạnh Quỳnh", reels: "5K+"),
    AudioResult(avatar: 'assets/image/audio_04.jpg', name: "Anh đã ổn hơn", author: "MCK", reels: "2K+"),
    AudioResult(avatar: 'assets/image/audio_01.jpg', name: "Loi choi 1", author: "Wren Evans", reels: "1314"),
    AudioResult(avatar: 'assets/image/audio_02.jpg', name: "Loi choi 2", author: "Wren Evans", reels: "134"),
    AudioResult(avatar: 'assets/image/audio_03.jpg', name: "Tri kỉ", author: "Phan Mạnh Quỳnh", reels: "5K+"),
    AudioResult(avatar: 'assets/image/audio_04.jpg', name: "Anh đã ổn hơn", author: "MCK", reels: "2K+"),
  ];
}

class DataReels {
  static List<Reels> listReels = [
    Reels(avatar: "assets/test.jpg", views: "28.1K"),
    Reels(avatar: "assets/image/audio_01.jpg", views: "3M"),
    Reels(avatar: "assets/image/audio_02.jpg", views: "1.4M"),

    Reels(avatar: "assets/image/audio_03.jpg", views: "1.5M"),
    Reels(avatar: "assets/image/audio_04.jpg", views: "601K"),
    Reels(avatar: "assets/test.jpg", views: "3.1M"),

    Reels(avatar: "assets/test.jpg", views: "28.1K"),
    Reels(avatar: "assets/image/audio_01.jpg", views: "3M"),
    Reels(avatar: "assets/image/audio_02.jpg", views: "1.4M"),

    Reels(avatar: "assets/image/audio_03.jpg", views: "1.5M"),
    Reels(avatar: "assets/image/audio_04.jpg", views: "601K"),
    Reels(avatar: "assets/test.jpg", views: "3.1M"),

    Reels(avatar: "assets/test.jpg", views: "28.1K"),
    Reels(avatar: "assets/image/audio_01.jpg", views: "3M"),
    Reels(avatar: "assets/image/audio_02.jpg", views: "1.4M"),

    Reels(avatar: "assets/image/audio_03.jpg", views: "1.5M"),
    Reels(avatar: "assets/image/audio_04.jpg", views: "601K"),
    Reels(avatar: "assets/test.jpg", views: "3.1M"),

    Reels(avatar: "assets/test.jpg", views: "28.1K"),
    Reels(avatar: "assets/image/audio_01.jpg", views: "3M"),
    Reels(avatar: "assets/image/audio_02.jpg", views: "1.4M"),

    Reels(avatar: "assets/image/audio_03.jpg", views: "1.5M"),
    Reels(avatar: "assets/image/audio_04.jpg", views: "601K"),
    Reels(avatar: "assets/test.jpg", views: "3.1M"),

    Reels(avatar: "assets/test.jpg", views: "28.1K"),
    Reels(avatar: "assets/image/audio_01.jpg", views: "3M"),
    Reels(avatar: "assets/image/audio_02.jpg", views: "1.4M"),

    Reels(avatar: "assets/image/audio_03.jpg", views: "1.5M"),
    Reels(avatar: "assets/image/audio_04.jpg", views: "601K"),
    Reels(avatar: "assets/test.jpg", views: "3.1M"),
  ];
}