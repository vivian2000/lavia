import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/home/crop/crops_view.dart';
import 'package:la_via/home/crop/managers/crop_cubit.dart';
import 'package:la_via/register/managers/signup_cubit.dart';
import 'package:la_via/register/social_media_button.dart';
import 'package:la_via/text_form_feild.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var signUpKey = GlobalKey<FormState>();
  TextEditingController addField = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  bool x = true;

  void initState() {
    super.initState();
    addField.addListener(() {
      setState(() {}); // setState every time text changes
    });
    password.addListener(() {
      setState(() {}); // setState every time text changes
    });
    cPassword.addListener(() {
      setState(() {}); // setState every time text changes
    });
    email.addListener(() {
      setState(() {}); // setState every time text changes
    });
    firstName.addListener(() {
      setState(() {}); // setState every time text changes
    });
    lastName.addListener(() {
      setState(() {}); // setState every time text changes
    });
  }

  @override
  void dispose() {
    addField.dispose();
    password.dispose();
    cPassword.dispose();
    email.dispose();
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CropsView(),
            ),
          );
          context.read<CropCubit>().cropFunction();
        } else if (state is SignupErrorState) {
          SnackBar snackBar =
              const SnackBar(content: Center(child: Text('Entry denied')));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: signUpKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 45),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldWidget(
                          controller: firstName,
                          text: 'First Name',
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'First Name in Empty';
                            }
                            return null;
                          },
                          onChanged: (p0) {},
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: TextFormFieldWidget(
                          controller: lastName,
                          text: 'Last Name',
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty) {
                              return 'Last Name in Empty';
                            }
                            return null;
                          },
                          onChanged: (p0) {},
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextFormFieldWidget(
                    text: 'Add Your Field',
                    controller: addField,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Field in Empty';
                      }
                      return null;
                    },
                    onChanged: (p0) {},
                  ),
                  TextFormFieldWidget(
                    text: 'E-mail',
                    controller: email,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Email in Empty';
                      }
                      return null;
                    },
                    onChanged: (p0) {},
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextFormFieldWidget(
                    text: 'Password',
                    controller: password,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Password is Empty';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          x = !x;
                        });
                      },
                      color: AppColor.colorGreen,
                      icon: Icon(x
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    ),
                    onChanged: (p0) {},
                  ),
                  SizedBox(height: size.height * 0.01),
                  TextFormFieldWidget(
                    text: 'Confirm password',
                    controller: cPassword,
                    validator: (p0) {
                      if (p0 == null || p0.isEmpty) {
                        return 'Confirm Password is Empty';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          x = !x;
                        });
                      },
                      color: AppColor.colorGreen,
                      icon: Icon(x
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined),
                    ),
                    onChanged: (p0) {},
                  ),
                  SizedBox(height: size.height * 0.01),
                  InkWell(
                    onTap: () {
                      BlocProvider.of<SignupCubit>(context).signup(
                        firstName: firstName.text,
                        lastName: lastName.text,
                        addField: addField.text,
                        email: email.text,
                        password: password.text,
                        password2: cPassword.text,
                      );
                    },
                    child: Container(
                      height: 38,
                      decoration: BoxDecoration(
                          color: AppColor.colorGreen,
                          borderRadius: BorderRadius.circular(5)),
                      child: state is SignupLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                          : const Center(
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                    ),
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
