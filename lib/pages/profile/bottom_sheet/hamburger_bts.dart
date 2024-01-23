import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/SourceString.dart';

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

          getTypeCreate(name: "Cài đặt và quyền riêng tư", icon: const FaIcon(FontAwesomeIcons.gear)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Threads", icon: const FaIcon(FontAwesomeIcons.threads)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Hoạt động của bạn", icon: const FaIcon(FontAwesomeIcons.image)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Kho lưu trữ", icon: const FaIcon(FontAwesomeIcons.clockRotateLeft)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Mã QR", icon: const FaIcon(FontAwesomeIcons.qrcode)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Đã lưu", icon: const FaIcon(FontAwesomeIcons.bookBookmark)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Giám sát", icon: const FaIcon(FontAwesomeIcons.userGroup)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Đơn đặt hàng và thanh toán", icon: const FaIcon(FontAwesomeIcons.creditCard)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Bạn thân", icon: const FaIcon(FontAwesomeIcons.bars)),
          const Divider(indent: 48,),

          getTypeCreate(name: "Yêu thích", icon: const FaIcon(FontAwesomeIcons.star)),
          const Divider(indent: 48,),

        ]
    );
  }
  ListTile getTypeCreate({required String name, required FaIcon icon}){
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      title: Text(name),
      leading: icon
    );
  }

}