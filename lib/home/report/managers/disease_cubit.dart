import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/constants.dart';
import 'package:la_via/models/report_details.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'disease_state.dart';

class DiseaseCubit extends Cubit<DiseaseState> {
  DiseaseCubit() : super(DiseaseInitialState());
  static DiseaseCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();
  List<ReportDetails> reportData = [];
  Reports reports = Reports();
  Future<void> reportFunction() async {
    emit(DiseaseLoadingState());
    await dioHelper.getData(endPoint: reportEndPoint).then((response) {
      print(response);
      reports = Reports.fromJson(response.data);
      print('The Status Code of Get report');
      print(response.statusCode.toString());
      print('------');
      final data2 = response.data;
      List<dynamic> data3 = data2['Reports'];
      // List<dynamic> data4 = data2['crops']['crop_name'];
      print('List Of report is $data3');

      if(data3.isNotEmpty) {
        response.data['Reports'].forEach((reportOne) {
          reportData.add(ReportDetails.fromJson(reportOne));
          print(reportData);
        });
      }
      emit(DiseaseSuccessState());
    }).catchError((error) {
      print('Error in Get report is $error');
      emit(DiseaseErrorState());
    });
  }


}
