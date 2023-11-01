import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/layout/home_screen/home_screen.dart';
import 'package:green/widgets/circle_button_widget.dart';
import 'package:green/widgets/elevated_button_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/widgets/get_started_background.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:green/widgets/toast_widget.dart';



import '../../widgets/text_form_field_widget.dart';
import '../login_screen/cubit/user_cubit.dart';
import '../login_screen/cubit/user_states.dart';
import '../login_screen/login_screen.dart';


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
          showToast("The Email is already registered",ToastStates.error);
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Form(
              key: formKey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  background(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "Register ",
                                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 35,color: Colors.white))),
                            Text(
                                "Now!",
                                style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 38,fontWeight: FontWeight.bold,color: Colors.greenAccent))),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        DefaultTextFormField(
                          prefix: Icons.short_text,
                          controller: nameController,
                          type: TextInputType.text,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Name';
                            }
                          },
                          label: "User Name",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultTextFormField(
                          prefix: Icons.mail,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your E-mail';
                            }
                          },
                          label: "E-mail",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DefaultTextFormField(
                          isPassword: UserCubit.get(context).hidePass,
                          controller: passwordController,
                          type: TextInputType.text,
                          validate: (var value) {
                            if (value.isEmpty) {
                              return 'Please enter your password';
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
                            builder: (context) => DefaultElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    UserCubit.get(context).signUp(
                                      name: nameController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'Sign Up'
                            ),
                            fallback: (context) =>
                            const Center(child:                                                 SpinKitWaveSpinner(
                              trackColor: Colors.lightGreenAccent,
                              waveColor: Colors.lightGreenAccent,
                              color: Colors.green,
                              size: 50.0,
                            ),

                            )),
                        SizedBox(height: 35,),
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
                              child: Text("Or Login With",style: TextStyle(fontSize: 15 ,color: Colors.grey.shade200),),
                            ),
                            Expanded(
                              child: Container(
                                height: 1,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            circleButton(onTap: (){}, icon: Icons.facebook,iconColor: Colors.blue),
                            SizedBox(width: 10,),
                            circleButton(onTap: (){}, icon: Icons.g_mobiledata_outlined,iconColor: Colors.red),
                            SizedBox(width: 10,),
                            circleButton(onTap: (){}, icon: Icons.apple_outlined,iconColor: Colors.black)
                          ],
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already Have Account?",style: TextStyle(color: Colors.white),),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                        (route) => false);
                              },
                              child: const Text("Log in",style: TextStyle(color: Colors.greenAccent),),
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
