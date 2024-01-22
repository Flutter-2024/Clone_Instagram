import 'package:flutter/material.dart';
import '../../../constants/SourceString.dart';

class PostCreateBts extends StatelessWidget{
  const PostCreateBts({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
        Divider(thickness: 3,indent: (width / 2) - 50,endIndent: (width / 2) - 50,),
        const SizedBox(height: 10,),
        const Text(SourceString.create,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          textAlign: TextAlign.center,
        ),
        const Divider(),
        getTypeCreate(name: "Thước phim", picture: "assets/images/film.png"),
        const Divider(indent: 48,),
        getTypeCreate(name: "Bài viết", picture: "assets/images/post.png"),
        const Divider(indent:48,),
        getTypeCreate(name: "Tin", picture: "assets/images/add.png"),
        const Divider(indent:48,),
        getTypeCreate(name: "Tin nổi bật", picture: "assets/images/heart.png"),
        const Divider(indent:48,),
        getTypeCreate(name: "Trực tiếp", picture: "assets/images/heart.png"),
        const Divider(indent:48,),
        getTypeCreate(name: "Dành cho bạn", picture: "assets/images/heart.png"),
      ]
    );
  }
  ListTile getTypeCreate({required String name, required String picture}){
    return ListTile(
        title: Text(name),
        leading: Image.asset(picture),
    );
  }
}