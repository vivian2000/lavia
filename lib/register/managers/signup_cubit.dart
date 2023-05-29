import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/constants.dart';
import 'package:la_via/provider/my_auth_cache.dart';
import 'package:la_via/provider/my_auth_cache_keys.dart';
import 'package:la_via/register/data/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context) => BlocProvider.of(context);
  DioHelper dioHelper = DioHelper();

  Future<void> signup(String firstName, String lastName,String addField, String email,
      String password, String password2) async {
    emit(SignupLoadingState());
    await dioHelper.postData(endPoint: signupEndPoint, body: {
      'username': addField,
      'password': password,
      'password2': password2,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
    }).then((value) {
      print("Success");
      print(value.data);
      MyAuthCache.putString(
          key: MyAuthCacheKeys.token, value: value.data['token']);
      MyAuthCache.putString(key: MyAuthCacheKeys.userName, value: value.data['username']);
      print('----------------');
      print(MyAuthCache.getString(key: MyAuthCacheKeys.userName));
      print('----------------');
      MyAuthCache.putString(key: MyAuthCacheKeys.email, value: value.data['email']);
      print('----------------');
      print(MyAuthCache.getString(key: MyAuthCacheKeys.email));
      print('----------------');
      MyAuthCache.putString(key: MyAuthCacheKeys.first_name, value: value.data['first_name']);
      print('----------------');
      print(MyAuthCache.getString(key: MyAuthCacheKeys.first_name));
      print('----------------');
      MyAuthCache.putString(key: MyAuthCacheKeys.last_name, value: value.data['last_name']);
      print('----------------');
      print(MyAuthCache.getString(key: MyAuthCacheKeys.last_name));
      print('----------------');
      print('Token is ${MyAuthCache.getString(key: MyAuthCacheKeys.token)}');
      emit(SignupSuccessState());
    }).catchError((error) {
      print("Signup Error is $error");
      emit(SignupErrorState());
    });
  }
}
