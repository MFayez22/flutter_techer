import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_techer/constant/constant.dart';
import 'package:flutter_techer/cubit/state.dart';

import '../models/group_model.dart';
import '../models/student_model.dart';
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
        name: name, phone: phone, email: email, id: id, password: password,isAdmin: true);
    FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .set(userModel.toMap())
        .then((value) {});
  }

  void login({required String email, required String password}) {
    emit(LoginLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          uId = value.user!.uid;
          getUserData();
          emit(LoginSuccessState());

    })
        .catchError((error) {
          emit(LoginErrorState(error));
    });
  }



  UserModel? userModel;

  void getUserData() {
    emit(HomeLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.forJson(value.data()!);
      if(userModel!.isAdmin! )
      {
        emit(ISAdminSuccessState());
      }else{
        emit(ISAdminErrorState());
      }
      emit(HomeGetUserDataSuccessState());
    }).catchError((error) {
      emit(HomeGetUserDataErrorState(error.toString()));
    });
  }



  void setGroup({
    required String name,
  }) {
    emit(HomeSetGroupLoadingState());
    GroupModel groupModel = GroupModel(
        name: name,
   );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('groups')
        .add(groupModel.toMap())
        .then((value) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('groups')
          .doc(value.id)
          .update(GroupModel(

          name: name,

          id: value.id,

          )
          .toMap())
          .then((value) {
       emit(HomeSetGroupSuccessState());
      });
    }).catchError((error) {
     emit(HomeSetGroupErrorState(error.toString()));
    });
  }

  void setStudent({required String name,
    required String groupId,
    required String phone,
    required String studentEmail,
    required String studentPassword,
    required String studentUId,
    required String groupName,

  }) {
    String studentId='';
    emit(HomeSetStudentLoadingState());
    StudentModel studentModel = StudentModel(
      name: name,
      email: studentEmail,
      password: studentPassword,
      phone: phone,
      groupId: groupId,
      groupName: groupName,
      userId: uId,
      isAdmin: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('groups')
        .doc(groupId)
        .collection('students')
        .add(studentModel.toMap())
        .then((value) {
      studentId = value.id;
      FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .collection('groups')
          .doc(groupId)
          .collection('students')
          .doc(value.id)
          .update(StudentModel(
          name: name,
          id: value.id,
          password: studentPassword,
          email: studentEmail,
          phone: phone,
          groupId: groupId,
          userId: uId,
          groupName: groupName,
        isAdmin: false,
      ).toMap())
          .then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(studentUId)
            .set(StudentModel(
            name: name,
            id: studentId,
            password: studentPassword,
            email: studentEmail,
            phone: phone,
            groupId: groupId,
            groupName: groupName,
            isAdmin: false,
            userId: uId
        ).toMap()).then((value) {
          // FirebaseFirestore.instance
          //     .collection('students')
          //     .doc(value.id)
          //     .update(StudentModel(name: name,
          //     groupId: groupId,
          //   id: studentId,
          //     phone: phone,
          //     email: studentEmail,
          //     password: studentPassword,).toMap());
        });
       emit(HomeSetStudentSuccessState());
      });
    }).catchError((error) {
     emit(HomeSetStudentErrorState(error.toString()));
    });
  }

  void setEmailStudent({
    required String studentEmail,
    required String studentPassword,
    required String name,
    required String groupId,
    required String phone,
    required String groupName,
  }) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
        email: studentEmail, password: studentPassword)
        .then((value) {
      setStudent(
          groupId: groupId,
          name: name,
          phone: phone,
          studentEmail: studentEmail,
          studentPassword: studentPassword,
          groupName: groupName,
          studentUId: value.user!.uid
      );
    }).catchError((error) {
      print(error);
    });
  }


  List<GroupModel> groupModel = [];

  void getGroup() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('groups')
        .orderBy('name')
        .get()
        .then((value) {
      groupModel = [];
      value.docs.forEach((element) {
        groupModel.add(GroupModel.fromJson(element.data()));
      });

     emit(HomeGetGroupSuccessState());
    }).catchError((error) {
     emit(HomeGetGroupErrorState(error.toString()));
    });
  }

  List<StudentModel> studentModel = [];

  void getStudent({required String groupId}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('groups')
        .doc(groupId)
        .collection('students')
        .orderBy('name')
        .get()
        .then((value) {
      studentModel = [];
      value.docs.forEach((element) {
        studentModel.add(StudentModel.fromJson(element.data()));
      });
      emit(HomeGetStudentSuccessState());
    }).catchError((error) {
      emit(HomeGetStudentErrorState(error));
    });
  }

}
