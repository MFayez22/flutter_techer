import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_techer/cubit/state.dart';

import '../models/user_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;

  void changeVisible() {
    isVisible = !isVisible;

    emit(ChangeVisibleState());
  }

  void register(
      {required String name,
        required String phone,
        required String email,
        required String password}) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      setUserData(
        name: name,
        phone: phone,
        email: email,
        id: value.user!.uid,
        password: password,
      );
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterErrorState(error));
    });
  }

  void setUserData(
      {required String name,
        required String phone,
        required String id,
        required String email,
        required String password}) {
    UserModel userModel = UserModel(
        name: name, phone: phone, email: email, id: id, password: password);
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userModel.toMap())
        .then((value) {});
  }
}
