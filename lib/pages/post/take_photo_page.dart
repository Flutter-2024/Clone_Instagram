import 'package:camera/camera.dart';
import 'package:clone_instagram/pages/post/show_picture_camera_page.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import '../../main.dart';

class TakePhoto extends StatefulWidget {
  final AssetEntity assetEntity;

  const TakePhoto({super.key, required this.assetEntity});

  @override
  State<TakePhoto> createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  bool _isRearCameraSelected = true;

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
    );

    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        controller = cameraController;
      });
    }
    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      print('Error initializing camera: $e');
    }
    if (mounted) {
      setState(() {
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }

  @override
  void initState() {
    onNewCameraSelected(cameras[0]);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  Future<XFile?> takePicture() async {
    final CameraController? cameraController = controller;
    if (cameraController!.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      XFile file = await cameraController.takePicture();
      return file;
    } on CameraException catch (e) {
      print('Error occured while taking picture: $e');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    MemoryImage? displayedImage;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: _isCameraInitialized
                          ? AspectRatio(
                              aspectRatio: 1 / controller!.value.aspectRatio,
                              child: controller!.buildPreview(),
                            )
                          : Container(),
                    ),
                    Positioned(
                        right: 0,
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Colors.black45,
                              height: 150,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Transform.scale(
                                      scale: 2,
                                      child: CloseButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.flash_off,
                                          color: Colors.white,
                                          size: 40,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.settings,
                                          color: Colors.white,
                                          size: 40,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.black45,
                              height: 150,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () async {
                                  XFile? rawImage = await takePicture();
                                  if (rawImage != null) {
                                    // Convert XFile to Image
                                    img.Image? image = img.decodeImage(
                                        await rawImage.readAsBytes());

                                    if (image != null) {
                                      int x = 0;
                                      int y = (image.height - image.width) ~/ 2;
                                      int w = image.width;
                                      int h = image.width +12 ;

                                      img.Image croppedImage = img.copyCrop(
                                        image,
                                        x: x,
                                        y: y,
                                        width: w,
                                        height: h,
                                      );
                                      setState(() {
                                        displayedImage = MemoryImage(
                                          img.encodeJpg(croppedImage),
                                        );
                                      });
                                    }
                                  }

                                  if (!mounted) return;
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ShowPictureCameraPage(
                                        memoryImage: displayedImage,
                                        // imagePath: rawImage!.path,
                                      ),
                                    ),
                                  );
                                },
                                child: const Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Icon(Icons.circle,
                                        color: Colors.white38, size: 90),
                                    Positioned(
                                        bottom: 8,
                                        child: Icon(Icons.circle,
                                            color: Colors.white, size: 75)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(30),
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
                      onPressed: () {
                        setState(() {
                          _isCameraInitialized = false;
                        });
                        onNewCameraSelected(
                          cameras[_isRearCameraSelected ? 1 : 0],
                        );
                        setState(() {
                          _isRearCameraSelected = !_isRearCameraSelected;
                        });
                      },
                      icon: const Icon(
                        Icons.cached,
                        size: 32,
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
