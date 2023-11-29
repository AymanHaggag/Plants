//Dart Imports:
import 'dart:io';

//Flutter Imports:
import 'package:flutter/material.dart';

//Packages Imports:
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project Imports:
import 'package:green/generated/l10n.dart';
import 'package:green/widgets/elevated_button.dart';
import 'package:green/widgets/background.dart';
import 'package:green/widgets/loading_indecator.dart';
import 'package:green/widgets/text_form_field.dart';
import 'package:green/widgets/toast.dart';
import '../home/home_screen.dart';
import '../sign_up/sign_up_screen.dart';
import 'cubit/user_cubit.dart';
import 'cubit/user_states.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
   var formKey = GlobalKey<FormState>();


   @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
  listener: (context, state) {
    if(state is UserLoginSuccessfulState){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
          builder: (context) =>HomeScreen()),
              (route) => false);
    }else if(state is UserLoginErrorState) {
      showToast(
          "The Email or Password is incorrect",
          ToastStates.error);
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(S.of(context).welcomeText1,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 39,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                            ),
                        ),
                        ),
                        Text(S.of(context).welcomeText2,
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20,color: Colors.grey.shade200)),),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    AppTextFormField(
                        controller: emailController,
                        type: TextInputType.text,
                        label: "Email",
                      validate: (var value) {
                        if (value.isEmpty) {
                          return S.of(context).pleaseEnterYourEmail;
                        }
                      },
                    ),
                    const SizedBox(height: 15,),
                    AppTextFormField(
                      controller: passwordController,
                      isPassword: true,
                      type: TextInputType.text,
                      label: "Password",
                      validate: (var value) {
                        if (value.isEmpty) {
                          return S.of(context).pleaseEnterYourPassword;
                        }
                      },
                    ),
                    const SizedBox(height: 15,),
                    AppButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()){
                            await UserCubit.get(context).signIn(
                                email: emailController.text,
                                password: passwordController.text,
                            );
                          }
                        },
                        widget: ConditionalBuilder(
                          condition: state is UserGetUserLoadingState,
                          builder: (BuildContext context)=> const AppLoadingIndicator(),
                          fallback: (BuildContext context)=> Text(S.of(context).signIn,
                          ),
                        ),
                    ),
                    const SizedBox(height: 35,
                    ),
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
                          child: Text(
                            S.of(context).textForAnotherOptions,
                            style: TextStyle(fontSize: 15 ,color: Colors.grey.shade200),),
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
                        AppButton(
                          onPressed: (){
                          UserCubit.get(context).logInWithGoogleAccount();
                        },
                          widget :ConditionalBuilder(
                            condition: state is UserGetUserLoadingState,
                            builder: (BuildContext context)=> const AppLoadingIndicator(),
                            fallback: (BuildContext context)=> Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/icons/google_icon.png',
                                height: 32,
                                width: 32,
                              ),
                              SizedBox(width: 15,),
                              Text(S.of(context).signInWithGoogle),
                            ],
                          ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        if(Platform.isIOS)
                         AppButton(
                           onPressed: (){
                             //Sign in with google account function
                           },
                           widget :Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.apple_outlined,
                              color: Colors.black,
                              size: 32,
                            ),
                            SizedBox(width: 15,),
                            Text(S.of(context).signInWithApple),
                          ],
                         ),
                         ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(S.of(context).youDoNotHaveAccount
                          ,style: const TextStyle(
                              color: Colors.white,
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                        },
                            child:  Text(
                              S.of(context).signUp ,
                              style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 15,
                              ),
                            ),
                        ),
                      ],
                    )
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
