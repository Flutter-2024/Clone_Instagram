import 'package:clone_instagram/constants/source_string.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HamburgerBts extends StatelessWidget{
  const HamburgerBts({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        children: [
          Divider(thickness: 3,indent: (width / 2) - 50,endIndent: (width / 2) - 50,),
          const SizedBox(height: 10,),

          _getTypeCreate(name: SourceString.settingAndPrivacy, icon: const FaIcon(FontAwesomeIcons.gear)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.threads, icon: const FaIcon(FontAwesomeIcons.threads)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.activity, icon: const FaIcon(FontAwesomeIcons.image)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.archive, icon: const FaIcon(FontAwesomeIcons.clockRotateLeft)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.qrCode, icon: const FaIcon(FontAwesomeIcons.qrcode)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.saved, icon: const FaIcon(FontAwesomeIcons.bookBookmark)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.supervise, icon: const FaIcon(FontAwesomeIcons.userGroup)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.orderAndPayment, icon: const FaIcon(FontAwesomeIcons.creditCard)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.closeFriends, icon: const FaIcon(FontAwesomeIcons.bars)),
          const Divider(indent: 48,),

          _getTypeCreate(name: SourceString.favorite, icon: const FaIcon(FontAwesomeIcons.star)),
          const Divider(indent: 48,),

        ]
    );
  }
  ListTile _getTypeCreate({required String name, required FaIcon icon}){
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(name),
      leading: icon
    );
  }

}