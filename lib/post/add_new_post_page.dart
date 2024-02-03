
import 'package:clone_instagram/constants/SourceString.dart';
import 'package:clone_instagram/post/show_picture_camera_page.dart';
import 'package:clone_instagram/post/take_photo_page.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:clone_instagram/post/services/media_services.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';

class AddNewPostPage extends StatefulWidget {
  const AddNewPostPage({super.key});

  @override
  State<AddNewPostPage> createState() => _AddNewPostPageState();
}

class _AddNewPostPageState extends State<AddNewPostPage> {
  AssetPathEntity? selectedAlbum;
  List<AssetPathEntity> albumList = [];
  List<AssetEntity> assetList = [];
  AssetEntity? selectedEntity;
  List<AssetEntity> selectedAssetList = [];
  bool isMultiple = false;

  @override
  void initState() {
    MediaServices().loadAlbums(RequestType.common).then(
      (value) {
        setState(() {
          albumList = value;
          selectedAlbum = value[0];
        });
        MediaServices().loadAssets(selectedAlbum!).then(
          (value) {
            setState(() {
              assetList = value;
              selectedEntity = value[0];
            });
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: const CloseButton(
              color: Colors.white,
            ),
            centerTitle: true,
            title: const Text(
              SourceString.postTitle,
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return selectedAssetList.isEmpty ?
                          ShowPictureCameraPage(
                            image: selectedEntity!,
                          )
                              :
                          ShowPictureCameraPage(
                            listImages: selectedAssetList,
                          );
                        }
                    ),);
                  },
                  child: const Text(
                    SourceString.postNext,
                    style: TextStyle(color: Colors.blue),
                  ))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: height * 0.5,
                child: selectedEntity == null
                    ? const SizedBox.shrink()
                    : Stack(
                        children: [
                          Positioned.fill(
                              child: AssetEntityImage(
                            selectedEntity!,
                            isOriginal: false,
                            thumbnailSize: const ThumbnailSize.square(1000),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                child: Icon(
                                  Icons.error,
                                  color: Colors.red,
                                ),
                              );
                            },
                          )),
                          if (selectedEntity!.type == AssetType.video)
                            const Positioned.fill(
                              child: Center(
                                child: Icon(
                                  Icons.video_collection,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                            )
                        ],
                      ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      child: Row(
                        children: [
                          if (selectedAlbum != null)
                            GestureDetector(
                              onTap: () {
                                albums(height);
                              },
                              child: Text(
                                selectedAlbum!.name ==
                                        SourceString.postOptionRecently
                                    ? SourceString.postOptionGallery
                                    : selectedAlbum!.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  isMultiple = !isMultiple;
                                  selectedAssetList = [];
                                });
                              },
                              icon: Icon(
                                isMultiple == true
                                    ? Icons.file_copy
                                    : Icons.file_copy_outlined,
                                color: Colors.white,
                              )),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TakePhoto(assetEntity: selectedEntity!)
                                    //     CameraPage(
                                    //   assetEntity: selectedEntity!,
                                    // ),
                                    ),
                              );
                            },
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: assetList.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              itemCount: assetList.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 1,
                                      crossAxisSpacing: 1),
                              itemBuilder: (context, index) {
                                AssetEntity assetEntity = assetList[index];
                                return assetWidget(assetEntity);
                              }),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget assetWidget(AssetEntity assetEntity) => GestureDetector(
        onTap: () {
          setState(() {
            selectedEntity = assetEntity;
          });
        },
        child: Stack(
          children: [
            Positioned.fill(
                child: AssetEntityImage(
              assetEntity,
              isOriginal: false,
              thumbnailSize: const ThumbnailSize.square(250),
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                );
              },
            )),
            if (assetEntity.type == AssetType.video)
              const Positioned.fill(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.video_collection,
                    color: Colors.white,
                  ),
                ),
              )),
            Positioned.fill(
                child: Container(
              color: assetEntity == selectedEntity
                  ? Colors.white60
                  : Colors.transparent,
            )),
            if (isMultiple == true)
              Positioned.fill(
                  child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectAsset(assetEntity: assetEntity);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: selectedAssetList.contains(assetEntity) == true
                              ? Colors.blue
                              : Colors.white12,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "${selectedAssetList.indexOf(assetEntity) + 1}",
                          style: TextStyle(
                              color: selectedAssetList.contains(assetEntity) ==
                                      true
                                  ? Colors.white
                                  : Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ),
              ))
          ],
        ),
      );

  void selectAsset({required AssetEntity assetEntity}) {
    if (selectedAssetList.contains(assetEntity)) {
      setState(() {
        selectedAssetList.remove(assetEntity);
      });
    } else {
      setState(() {
        selectedAssetList.add(assetEntity);
      });
    }
  }

  void albums(height) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: (context) {
          return ListView.builder(
            itemCount: albumList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    selectedAlbum = albumList[index];
                  });
                  MediaServices().loadAssets(selectedAlbum!).then((value) {
                    setState(() {
                      assetList = value;
                      selectedEntity = assetList[0];
                    });
                  });
                  Navigator.pop(context);
                },
                title: Text(
                  albumList[index].name == SourceString.postOptionRecently
                      ? SourceString.postOptionGallery
                      : albumList[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          );
        });
  }
}
