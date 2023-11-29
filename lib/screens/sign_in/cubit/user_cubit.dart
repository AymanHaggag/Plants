//Flutter Imports:
import 'package:flutter/material.dart';

//Package Imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Project Imports:
import '../../../constants/constants.dart';
import '../../../models/user.dart';
import '../../../tools/storage/local/cashe_helper.dart';
import 'user_states.dart';


class UserCubit extends Cubit<UserStates> {
  UserCubit(super.initialState);

  static UserCubit get(context) => BlocProvider.of(context);

  bool hidePass = true;
  IconData suffixIcon = Icons.visibility;

  void hidePassword() {
    hidePass = !hidePass;
    suffixIcon = hidePass ? Icons.visibility : Icons.visibility_off;

    emit(UserHidePasswordState());
  }

  UserModel? currentUser;

  Future signIn({
    required String email,
    required String password,
  })  async {
    emit(UserLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uId =value.user!.uid;
      print("UID>>>>>>>>>>>>>>>>>>>${value.user!.uid}");
      CacheHelper.saveData(key: "uId", value: value.user!.uid);
      getUserData();


      emit(UserLoginSuccessfulState());
    }).catchError((error) {
      emit(UserLoginErrorState());
    });
  }

  void signUp({
    required String name,
    required String email,
    required String password,
  }) {
    emit(UserLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      createUser(
          name: name,
          email: email,
          uId: value.user!.uid,
      );
      CacheHelper.saveData(key: "uId", value: value.user!.uid);
      uId =value.user!.uid;
      getUserData();
      emit(UserRegistrationSuccessfulState());
    }).catchError((error) {
      emit(UserRegistrationErrorState());
    });
  }

  void createUser({
    required String name,
    required String email,
    required String uId,
  }) async {
    currentUser = UserModel(
      name: name,
      email: email,
      uId: uId,
    );

    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(currentUser!.toMap())
        .then((value) {
      emit(UserCreateUserSuccessfulState(uId));
    }).catchError((error) {
      emit(UserCreateUserErrorState());
    });
  }

  Future<void> getUserData() async {
    if (uId != null) {
      emit(UserGetUserLoadingState());
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uId)
          .get()
          .then((value) {
        currentUser = UserModel.fromJson(value.data()!);
        emit(UserGetUserSuccessfulState());
      }).catchError((error) {
        emit(UserGetUserErrorState());
      });
    }
  }


  Future<void> deleteAccount(String email, String password) async {
    try {
      // Create a credential with the provided email and password
      AuthCredential credential = EmailAuthProvider.credential(
        email: email,
        password: password,
      );

      // Re-authenticate the user to confirm their identity
      User? user = FirebaseAuth.instance.currentUser;
      await user!.reauthenticateWithCredential(credential);

      // Delete the user account
      await user.delete();

      // If the account is deleted successfully, the user will be signed out automatically.
      // You can handle any further actions like showing a success message or navigating to a different screen.

    } catch (error) {
      // Handle errors, such as incorrect password or network issues
      print("Error deleting account: $error");
    }
  }

  FirebaseAuth _auth =FirebaseAuth.instance;
  GoogleSignIn googleSignIn =GoogleSignIn();
 Future<void>logInWithGoogleAccount()async{
   GoogleSignInAccount? account = await googleSignIn.signIn();
   GoogleSignInAuthentication? authentication = await account?.authentication;
   AuthCredential credential=
       GoogleAuthProvider.credential(idToken : authentication?.idToken,accessToken: authentication?.accessToken);

    User? user = (await _auth.signInWithCredential(credential)).user;


   if (user != null){
     emit(UserLoginSuccessfulState());
     print(user!.email);
     print(user.displayName);
     print(user.phoneNumber);
     print(user.emailVerified);
   }

 }
}
