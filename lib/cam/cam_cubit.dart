import 'dart:io';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/constants.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
part 'cam_state.dart';

class CamCubit extends Cubit<CamState> {
  CamCubit() : super(CamInitialState());

  static CamCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();

  // Future<void> cam({required File image}) async {
  //   emit(CamLoadingState());
  //   await dioHelper.postData(endPoint: imageEndPoint, body:{
  //   //String fileName = image!.path.split('/').last;
  //   'image': await MultipartFile.fromFile(
  //   image.path,
  //   filename: Uri.file(image.path).pathSegments.last
  //   ),
  //   }).then((value) {
  //     print("Success");
  //     print(value.data);
  //     emit(CamSuccessState());
  //   }).catchError((error) {
  //     print("Login Error is $error");
  //     emit(CamErrorState());
  //   });
  // }

  Future<void> cam(File? img) async {
    print(img?.path);
    final url = Uri.parse('http://13.49.102.193:8000/api/uploadedImage/16/');
    //final request = http.put(url);
    // open a bytestream
    // var stream = new http.ByteStream(DelegatingStream.typed(img!.openRead()));
    // get file length
    // var length = await img.length();
    final request = http.MultipartRequest('PUT', url);
    // var multipartFile = new http.MultipartFile('file', stream, length,
    //     filename: basename(img.path));
    request.headers['Content-Type'] = 'multipart/form-data';

    final bytes = await img!.readAsBytesSync();
    final multipartFile = http.MultipartFile.fromBytes('picture', bytes,
      filename: img.path.split('/').last,
    );
    request.files.add(multipartFile);
    print(multipartFile);
    final response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print(response.statusCode);
      print('Image upload failed');
    }
    //await http.Response.fromStream(myRequest);
    //print(myRequest.statusCode);
    // if (myRequest.statusCode == 200) {
    //   final  resJson = jsonDecode(res.body);
    //   print("response here: $resJson");
    //   return resJson['result'];
    // } else {
    //   throw UnimplementedError();
    // }
  }
}
