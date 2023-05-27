import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/constants.dart';
import 'package:la_via/models/embedded.dart';
import 'package:la_via/models/embeddedData.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'embedded_data_state.dart';

class EmbeddedDataCubit extends Cubit<EmbeddedDataState> {
  EmbeddedDataCubit() : super(EmbeddedDataInitialState());
  
  static EmbeddedDataCubit get(context) => BlocProvider.of(context);
  
  // final EmbeddedDataController _embeddedDataController;
  
  List<EmbeddedData> embeddedData = [];

  Embedded embedded = Embedded();

  final DioHelper dioHelper = DioHelper();

  Future<void> fetchEmededData() async {
    emit(EmbeddedDataLoadingState());
    embeddedData = [];
    await dioHelper.getData(endPoint: embeddedsEndPoint).then((response) {
      print('The Status Code of Get Embedded');
      print(response.statusCode.toString());
      print('------');
      final data2 = response.data;
      List<dynamic> data3 = data2['embeddeds'];
      print('List is $data3');

      if(data3.isNotEmpty) {
        response.data['embeddeds'].forEach((embeddedOne) {
          embeddedData.add(EmbeddedData.fromJson(embeddedOne));
          print(embeddedData);
        });
      }
      emit(EmbeddedDataSuccessState());
    }).catchError((error) {
      print('Error in Get Embedded is $error');
      emit(EmbeddedDataErrorState());
    });
  }
  
  Future<void> fetchDataInTop() async {
    emit(EmbeddedInTopDataLoadingState());
    await dioHelper.getData(endPoint: embeddedEndPoint).then((response) {
      print(response.data['embedded']);
      embedded = Embedded.fromJson(response.data['embedded']);
      emit(EmbeddedInTopDataSuccessState());
    }).catchError((error) {
      print('Error in Embedded In Top Data is $error');
      emit(EmbeddedInTopDataErrorState());
    });
  }
  
  // List<EmbeddedData> fetchEmbeddedData() {
  //   _embeddedDataController.fetchEmbeddedData().then((embeddedData){
  //     emit(EmbeddedDataLoadingState(embeddedData));
  //     this.embeddedData = embeddedData;
  //   });
  //   return embeddedData;
  // }
}
