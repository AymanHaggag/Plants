import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green/modules/login_screen/cubit/user_states.dart';

import '../../../constants/constants.dart';
import '../../../models/user_model.dart';
import '../../../tools/local_storage_tool/cashe_helper.dart';

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

  Future login({
    required String email,
    required String password,
  })  async {
    emit(UserLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      uId =value.user!.uid;
      CacheHelper.saveData(key: "uId", value: value.user!.uid);
      getUserData();


      emit(UserLoginSuccessfulState());
    }).catchError((error) {
      print(error.toString());
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
      print(error.toString());
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
      print(error.toString());
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
        print(currentUser!.name);
        emit(UserGetUserSuccessfulState());
      }).catchError((error) {
        print(error.toString());
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

    } catch (e) {
      // Handle errors, such as incorrect password or network issues
      print("Error deleting account: $e");
    }
  }

}
