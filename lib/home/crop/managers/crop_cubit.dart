import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/models/crops.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'crop_state.dart';

class CropCubit extends Cubit<CropState> {
  CropCubit() : super(CropInitial());

  static CropCubit get(context) => BlocProvider.of(context);
  
  DioHelper dioHelper = DioHelper();

  List<CropDataModel> cropData = [];
  List<CropDataModel> cropData2 = [];

  CropDataModel cropDataModel = CropDataModel();
  
  Future<void> cropFunction() async {
    emit(CropLoadingState());
    await dioHelper.getData(endPoint: 'cropView/').then((response) {
      print('The Status Code of Get Crops');
      print(response.statusCode.toString());
      print('------');
      final data2 = response.data;
      List<dynamic> data3 = data2['crops'];
      // List<dynamic> data4 = data2['crops']['crop_name'];
      print('List Of Crop is $data3');

      if(data3.isNotEmpty) {
        response.data['crops'].forEach((cropOne) {
          cropData.add(CropDataModel.fromJson(cropOne));
          print(cropData);
        });
      }

      // if(data4.isNotEmpty) {
      //   response.data['crops'].forEach((cropOne) {
      //     cropData.add(CropDataModel.fromJson(cropOne));
      //     print(cropData);
      //   });
      // }
      emit(CropSuccessState());
    }).catchError((error) {
      print('Error in Get Crop is $error');
      emit(CropErrorState());
    });
  }
}
