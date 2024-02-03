import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class ImageItem {
  final MemoryImage? memoryImage;
  final AssetEntity? assetEntity;

  ImageItem({this.memoryImage, this.assetEntity});
}
