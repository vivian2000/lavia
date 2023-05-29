import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:la_via/cam/cam_cubit.dart';
import 'package:la_via/home/report/report.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
class CameraPage extends StatefulWidget {
  const CameraPage({Key? key, required this.cameras}) : super(key: key);

  final List<CameraDescription>? cameras;

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  DioHelper dio = DioHelper();
  List<String> imagePaths = [];
  late CameraController _cameraController;
  bool _isRearCameraSelected = true;
  File? image;
  Future<String> saveImageToGallery(File image) async {
    final appDir = await getTemporaryDirectory();
    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final newPath = '${appDir.path}/$fileName.jpg';
    await image.copy(newPath);
    await GallerySaver.saveImage(newPath, albumName: 'sas');
    return newPath;
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initCamera(widget.cameras![0]);
  }
  Future takePicture() async {
    if (!_cameraController.value.isInitialized) {
      return null;
    }
    if (_cameraController.value.isTakingPicture) {
      return null;
    }
    try {
      await _cameraController.setFlashMode(FlashMode.off);
      XFile picture = await _cameraController.takePicture();
      print('-----------------------------------------------------');
      print(picture.path);

      File imageFile = File(picture.path);
      if(imageFile.existsSync()){
        String imagePath = (await saveImageToGallery(imageFile));
        setState(() {
          imagePaths.add(imagePath);
          CamCubit.get(context).cam(imageFile);
          // BlocConsumer<CamCubit,CamState>(
          //   listener: (context,state){},
          //   builder: (context,state) {
          //     SnackBar snackBar = const SnackBar(
          //         content: Center(child: Text('Entry denied')));
          //      return
              // imageFile == null ?
              // ScaffoldMessenger.of(context).showSnackBar(snackBar) :
             // CamCubit.get(context).cam(image!);
            },
          );
        }else{print('Error: Image file does not exist');};
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Report(
                imagePaths,
              )));
      //Navigator.pop(context);
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }

      }


  Future initCamera(CameraDescription cameraDescription) async {
    _cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _cameraController.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CamCubit, CamState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0),
          title:const Text ("detect disease",style: TextStyle(color: Colors.white,fontSize: 17) ,),
        ),
        body: SafeArea(
          child: Stack(children: [
            (_cameraController.value.isInitialized)
                ? CameraPreview(_cameraController)
                : Container(
                color: Colors.black,
                child: const Center(child: CircularProgressIndicator())),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.20,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                      color: Colors.black),
                  child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    Expanded(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          iconSize: 30,
                          icon: Icon(
                              _isRearCameraSelected
                                  ? CupertinoIcons.switch_camera
                                  : CupertinoIcons.switch_camera_solid,
                              color: Colors.white),
                          onPressed: () {
                            setState(
                                    () => _isRearCameraSelected = !_isRearCameraSelected);
                            initCamera(widget.cameras![_isRearCameraSelected ? 0 : 1]);
                          },
                        )),
                    Expanded(
                        child: IconButton(
                          onPressed: takePicture,
                          iconSize: 50,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.circle, color: Colors.white),
                        )),
                    Expanded(
                        child: IconButton(
                          onPressed: pickImage,
                          iconSize: 50,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.image_outlined, color: Colors.white),
                        )
                    )
                  ]),
                )),
          ]),
        ));
  },
);
  }
  Future pickImage() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    File x = pickedFile as File;
    image = File(pickedFile!.path);
    //print(image?.path);
    print(image!.uri);
    //print(File(image!.path));
    await CamCubit.get(context).cam(x);
  }

}