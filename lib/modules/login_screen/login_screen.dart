import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:green/layout/home_screen/home_screen.dart';
import 'package:green/modules/login_screen/cubit/user_cubit.dart';
import 'package:green/modules/login_screen/cubit/user_states.dart';
import 'package:green/modules/sign_up_screen/sign_up_screen.dart';
import 'package:green/widgets/circle_button_widget.dart';
import 'package:green/widgets/elevated_button_widget.dart';
import 'package:green/widgets/get_started_background.dart';
import 'package:green/widgets/text_form_field_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/widgets/toast_widget.dart';




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
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
          builder: (context) =>HomeScreen()),
              (route) => false);
    }else if(state is UserLoginErrorState) {
      showToast("The Email or Password is incorrect",ToastStates.error);
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello! 👋",
                        style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 39,color: Colors.white,fontWeight: FontWeight.bold)),),
                        Text("Welcome Back!, You've been missed",
                          style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20,color: Colors.grey.shade200)),),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    DefaultTextFormField(
                        controller: emailController,
                        type: TextInputType.text,
                        label: "Email",
                      validate: (var value) {
                        if (value.isEmpty) {
                          return 'Please enter your Email';
                        }
                      },
                    ),
                    SizedBox(height: 15,),
                    DefaultTextFormField(
                      controller: passwordController,
                      isPassword: true,
                      type: TextInputType.text,
                      label: "Password",
                      validate: (var value) {
                        if (value.isEmpty) {
                          return 'Please enter your password';
                        }
                      },
                    ),
                    SizedBox(height: 15,),
                    DefaultElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()){
                            await UserCubit.get(context).login(
                                email: emailController.text,
                                password: passwordController.text
                            );
                          }
                        },
                        text: "Login"),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("you don't have account?",style: TextStyle(color: Colors.white),),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));
                        }, child: Text("Sign Up" ,style: TextStyle(color: Colors.greenAccent, fontSize: 15),)),
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
