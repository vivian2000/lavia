import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/constants.dart';
import 'package:la_via/models/report_details.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
part 'disease_state.dart';

class DiseaseCubit extends Cubit<DiseaseState> {
  DiseaseCubit() : super(DiseaseInitialState());

  static DiseaseCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();


  ReportDetails? report;

  Future<void> reportFunction() async {
    emit(DiseaseLoadingState());
    await dioHelper.getData(endPoint: reportEndPoint).then((response) {
      report = ReportDetails.fromJson(response.data);
      emit(DiseaseSuccessState());
    }).catchError((error) {
      print('Error in Get report is $error');
      emit(DiseaseErrorState());
    });
  }
}
