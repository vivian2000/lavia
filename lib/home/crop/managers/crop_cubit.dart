import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/models/crops.dart';
import 'package:la_via/models/select_up_model.dart';

import 'package:la_via/register/data/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'crop_state.dart';

class CropCubit extends Cubit<CropState> {
  CropCubit() : super(CropInitial());

  static CropCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();

  CropDataModel? cropDataModel;

  Future<void> cropFunction() async {
    emit(CropLoadingState());
    await dioHelper.getData(endPoint: 'cropView/').then((response) {
      print('The Status Code of Get Crops');
      cropDataModel = CropDataModel.fromJson(response.data);

      emit(CropSuccessState());
    }).catchError((error) {
      print('Error in Get Crop is $error');
      emit(CropErrorState());
    });
  }

  SelectUpModel? selectUpModel;

  Future<void> selectUp(
      String soil_moisture_min, String soil_moisture_max) async {
    emit(SelectedLoadingState());
    await dioHelper.putData(endPoint: 'selectup/', body: {
      "soil_moisture_min": soil_moisture_min,
      "soil_moisture_max": soil_moisture_max,
    }).then((response) {
      print('The Status Code of Get selectup');
      selectUpModel = SelectUpModel.fromJson(response.data);

      emit(SelectedSuccessState());
    }).catchError((error) {
      print('Error in Get Selected is $error');
      emit(SelectedErrorState());
    });
  }
}
