import 'package:camera/camera.dart';
import 'package:clone_instagram/pages/post/show_picture_camera_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';


import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class CameraPage extends StatefulWidget {
  final AssetEntity assetEntity;
  const CameraPage({super.key,  required this.assetEntity});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _controllerInitializer;
  late List<CameraDescription> _availableCameras;
  int _selectedCameraIndex = 0;

  @override
  void initState() {
    _availableCameras = [];
    _initializeCameras();
    super.initState();
  }
  Future<void> _initializeCameras() async {
    try {
      _availableCameras = await availableCameras();
      _controller = CameraController(
        _availableCameras[_selectedCameraIndex],
        ResolutionPreset.medium,
      );
      _controllerInitializer = _controller.initialize();
      if (mounted) {
       setState(() {});
      }
    } catch (e) {
      print('Error initializing cameras: $e');
    }
  }
  Future<void> _toggleCamera() async {
    await _controller.dispose();
    _selectedCameraIndex = (_selectedCameraIndex + 1) % _availableCameras.length;
    await _initializeCameras();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: 0,
        right: 0,
        height: MediaQuery.of(context).size.height * 0.9,
        child: FutureBuilder(
          future: _controllerInitializer,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_controller);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      Positioned.fill(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.black45,
            leading: const CloseButton(
              color: Colors.white,
            ),
            centerTitle: true,
            title: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.flash_off,
                  color: Colors.white,
                  size: 24,
                )),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 24,
                  ))
            ],
          ),
          body: Stack(
            children: [
              Positioned(
                right: 0,
                left: 0,
                bottom: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                   color: Colors.black45,
                  //padding: EdgeInsets.only(top: 50),
                  child: FloatingActionButton(
                     backgroundColor: Colors.transparent,
                    onPressed: () async {
                      try {
                        await _controllerInitializer;
                        final image = await _controller.takePicture();
                        if (!mounted) return;
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ShowPictureCameraPage(
                              imagePath: image.path,
                            ),
                          ),
                        );
                      } catch (e) {}
                    },
                    child: Container(
                      decoration: BoxDecoration(
                         color: Colors.white.withOpacity(0.5),// color: Colors.white,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(30)),
                        border: Border.all(
                            width: 5, color: Colors.white.withOpacity(0.5)),
                      ),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 40,
                right: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      child: ClipRect(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: AssetEntityImage(
                            widget.assetEntity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {_toggleCamera();},
                      icon: const Icon(Icons.cached),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
