import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/constants.dart';
import 'package:la_via/models/user_data.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'get_profile_data_state.dart';

class GetProfileDataCubit extends Cubit<GetProfileDataState> {
  GetProfileDataCubit() : super(GetProfileDataInitialState());

  static GetProfileDataCubit get(context) => BlocProvider.of(context);

  DioHelper dioHelper = DioHelper();
  UserData? userData ;

  /// Get Profile Data
  Future<void> getProfileData() async {
    emit(GetProfileDataLoadingState());
    await dioHelper.getData(endPoint: getDetailsEndPoint).then((response) {
      print(response.data);
      userData = UserData.fromJson(response.data);
      emit(GetProfileDataSuccessState());
    }).catchError((error) {
      print('Error in Get Data in Profile Screen is $error');
      emit(GetProfileDataErrorState());
    });
  }

  /// Change Profile Data
  Future<void> changeProfileData() async {
    emit(ChangeProfileDataLoadingState());
    await dioHelper.putData(endPoint: updateProfileEndPoint).then((response) {
      print(response.data);
      emit(ChangeProfileDataSuccessState());
    }).catchError((error) {
      print('Erro in Update or Cahnge Profile Data is $error');
      emit(ChangeProfileDataErrorState());
    });
  }
}
