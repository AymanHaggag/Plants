// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Packages imports:
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

// project imports:
import 'package:green/generated/l10n.dart';
import 'package:green/widgets/elevated_button.dart';
import 'package:green/widgets/background.dart';
import 'package:green/widgets/loading_indecator.dart';
import 'package:green/widgets/toast.dart';
import '../../widgets/text_form_field.dart';
import '../home/home_screen.dart';
import '../sign_in/cubit/user_cubit.dart';
import '../sign_in/cubit/user_states.dart';
import '../sign_in/sign_in_screen.dart';


class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        if(state is UserCreateUserSuccessfulState){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (context) =>HomeScreen()),
                  (route) => false);
        } else if (state is UserCreateUserErrorState){
          showToast(S.of(context).thisEmailAlreadyRegistered,ToastStates.error);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: formKey,
              child: Stack(

                alignment: Alignment.center,
                children: [
                  AppBackground(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                S.of(context).register,
                                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 35,color: Colors.white))),
                            Text(
                                S.of(context).now,
                                style: GoogleFonts.poppins(textStyle: const TextStyle(fontSize: 38,fontWeight: FontWeight.bold,color: Colors.greenAccent))),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AppTextFormField(
                          prefix: Icons.short_text,
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value.isEmpty) {
                              return S.of(context).pleaseEnterYourName;
                            }
                          },
                          label: "User Name",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          prefix: Icons.mail,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return S.of(context).pleaseEnterYourEmail;
                            }
                          },
                          label: "Email",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppTextFormField(
                          isPassword: UserCubit.get(context).hidePass,
                          controller: passwordController,
                          type: TextInputType.text,
                          validate: (var value) {
                            if (value.isEmpty) {
                              return S.of(context).pleaseEnterYourPassword;
                            }
                          },
                          label: "Password",
                          prefix: Icons.lock_outline,
                          // suffix: UserCubit.get(context).suffixIcon,
                          suffixPressed: () {
                            // UserCubit.get(context).hidePassword();
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ConditionalBuilder(
                            condition: state is! UserLoadingState,
                            builder: (context) => AppButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    UserCubit.get(context).signUp(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                widget: Text(S.of(context).signUp)
                            ),
                            fallback: (context) => const AppLoadingIndicator()
                        ),
                        const SizedBox(height: 35,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(S.of(context).textForAnotherOptions,style: TextStyle(fontSize: 15 ,color: Colors.grey.shade200),),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppButton(onPressed: (){
                              UserCubit.get(context).logInWithGoogleAccount();
                            }, widget :Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/icons/google_icon.png',
                                  height: 32,
                                  width: 32,),
                                SizedBox(width: 15,),
                                Text(S.of(context).signInWithGoogle),

                              ],
                            ) ),
                            const SizedBox(width: 20,),
                            if(Platform.isIOS)
                              AppButton(onPressed: (){}, widget :Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.apple_outlined,color: Colors.black,size: 32,),
                                  SizedBox(width: 15,),
                                  Text(S.of(context).signInWithApple),

                                ],
                              ) ),
                          ],
                        ),
                         Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(S.of(context).alreadyHaveAccount,style: TextStyle(color: Colors.white),),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                        (route) => false);
                              },
                              child:  Text(
                                S.of(context).signIn,
                                style: TextStyle(color: Colors.greenAccent),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
