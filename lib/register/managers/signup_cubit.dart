import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/constants.dart';
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
      emit(SignupSuccessState());
    }).catchError((error) {
      print("Signup Error is $error");
      emit(SignupErrorState());
    });
  }
}
