import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/source_string.dart';
class ItemHamburger{
  String name;
  FaIcon icon;
  ItemHamburger({required this.name, required this.icon});
  static List<ItemHamburger> listHamburger = [
    ItemHamburger(name: SourceString.settingAndPrivacy,icon : const FaIcon(FontAwesomeIcons.gear)),
    ItemHamburger(name: SourceString.threads, icon: const FaIcon(FontAwesomeIcons.threads)),
    ItemHamburger(name: SourceString.activity, icon: const FaIcon(FontAwesomeIcons.image)),
    ItemHamburger(name: SourceString.archive, icon: const FaIcon(FontAwesomeIcons.clockRotateLeft)),
    ItemHamburger(name: SourceString.qrCode,icon: const FaIcon(FontAwesomeIcons.qrcode)),
    ItemHamburger(name: SourceString.saved,icon: const FaIcon(FontAwesomeIcons.bookBookmark)),
    ItemHamburger(name: SourceString.supervise,icon: const FaIcon(FontAwesomeIcons.userGroup)),
    ItemHamburger(name: SourceString.orderAndPayment,icon: const FaIcon(FontAwesomeIcons.creditCard)),
    ItemHamburger(name: SourceString.closeFriends,icon: const FaIcon(FontAwesomeIcons.bars)),
    ItemHamburger(name: SourceString.favorite, icon: const FaIcon(FontAwesomeIcons.star)),

  ];
}
//const Divider(indent: 48,),