import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/constants.dart';
import 'package:la_via/provider/my_auth_cache.dart';
import 'package:la_via/provider/my_auth_cache_keys.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();

  Future<void> login(String userName, String password) async {
    emit(LoginLoadingState());
    await dioHelper.postData(endPoint: loginEndPoint, body: {
      'username':userName,
      'password':password,
    }).then((value) {
      print("Success");
      print(value.data);
      // MyAuthCache.putString(
      //     key: MyAuthCacheKeys.token, value: value.data['token']);
      // MyAuthCache.putString(key: MyAuthCacheKeys.userName, value: value.data['username']);
      // print('----------------');
      // print(MyAuthCache.getString(key: MyAuthCacheKeys.userName));
      // print('----------------');
      // print('Token is ${MyAuthCache.getString(key: MyAuthCacheKeys.token)}');
      emit(LoginSuccessState());
    }).catchError((error) {
      print("Login Error is $error");
      emit(LoginErrorState());
    });
  }
}
