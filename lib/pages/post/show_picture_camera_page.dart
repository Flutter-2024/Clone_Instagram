import 'dart:io';

import 'package:flutter/material.dart';

import '../../constants/SourceString.dart';

class ShowPictureCameraPage extends StatefulWidget {
  final String imagePath;
   const ShowPictureCameraPage({super.key, required this.imagePath});

  @override
  State<ShowPictureCameraPage> createState() => _ShowPictureCameraPageState();
}

class _ShowPictureCameraPageState extends State<ShowPictureCameraPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: () {
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back), color: Colors.white,),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                SourceString.postNext,
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Image.file(File(widget.imagePath), fit: BoxFit.fill,)),
    );
  }
}

