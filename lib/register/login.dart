import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/home/crop/crops_view.dart';
import 'package:la_via/home_screen.dart';
import 'package:la_via/register/managers/login_cubit.dart';
import 'package:la_via/register/social_media_button.dart';
import 'package:la_via/text_form_feild.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var loginKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  bool x = true;


  void initState() {
    super.initState();
    userName.addListener(() {
      setState(() {}); // setState every time text changes
    });
    password.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginSuccessState) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
             //builder: (context) => CropsView(),
          ),
        );
      } else if (state is LoginErrorState) {
        SnackBar snackBar = const SnackBar(content: Center(child: Text('Entry denied')));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }, builder: (context, state) {
      return SingleChildScrollView(
        child: Form(
          key: loginKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 45),
            child: Column(
              children: [
                TextFormFieldWidget(
                  text: 'Your Field',
                  controller: userName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "E_mail must not be empty";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (p0) {},
                ),
                SizedBox(height: size.height * 0.01),
                TextFormFieldWidget(
                  text: 'Password',
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password must not be empty";
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        x = !x;
                      });
                    },
                    icon: Icon(x
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined),
                  ),
                  onChanged: (p0) {},
                ),
                SizedBox(height: size.height * 0.01),
                InkWell(
                  onTap: () {
                    BlocProvider.of<LoginCubit>(context)
                        .login(userName.text, password.text);
                  },
                   child: Container(
                     height: 38,
                     decoration: BoxDecoration(
                       color: AppColor.colorGreen,
                       borderRadius: BorderRadius.circular(5)
                     ),
                     child: state is LoginLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(

                            color: Colors.white,
                          ))
                        : const Center(
                            child: Text('Login',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                   ),
                ),
                const Divider(),
                const SocialMediaButton(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
