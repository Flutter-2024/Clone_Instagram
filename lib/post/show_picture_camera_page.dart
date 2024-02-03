import 'package:clone_instagram/post/models/post_item.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

import '../constants/SourceString.dart';
import 'models/image_item.dart';

class ShowPictureCameraPage extends StatefulWidget {
  final AssetEntity? image;
  final MemoryImage? memoryImage;
  final List<AssetEntity>? listImages;

  const ShowPictureCameraPage(
      {super.key, this.image, this.memoryImage, this.listImages});

  @override
  State<ShowPictureCameraPage> createState() => _ShowPictureCameraPageState();
}

class _ShowPictureCameraPageState extends State<ShowPictureCameraPage> {
  List<PostItem> postItems = [];
  final textController = TextEditingController();

  void _addImageToList() {
    late PostItem item;
    if (widget.listImages != null) {
      for (final img in widget.listImages!) {
        item = PostItem(
            imageItem: ImageItem(assetEntity: img),
            content: textController.text);
        postItems.add(item);
      }
    } else if (widget.image != null) {
      item = PostItem(
          imageItem: ImageItem(assetEntity: widget.image),
          content: textController.text);
      postItems.add(item);
    } else {
      item = PostItem(
          imageItem: ImageItem(memoryImage: widget.memoryImage),
          content: textController.text);
      postItems.add(item);
    }
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          SourceString.postNewTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  widget.listImages != null
                      ? Container(
                          height: height * 0.3,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.listImages!.length,
                            itemBuilder: (context, index) {
                              return AssetEntityImage(
                                widget.listImages![index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 12,
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: height * 0.3,
                          child: widget.image != null
                              ? AssetEntityImage(
                                  widget.image!,
                                  //fit: BoxFit.cover,
                                )
                              : Image.memory(widget.memoryImage!.bytes),
                        ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, top: 12),
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter here',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(width, 8),
                backgroundColor: Colors.blue,
              ),
              onPressed: () {
                _addImageToList();
              },
              child: const Text(
                SourceString.post,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
