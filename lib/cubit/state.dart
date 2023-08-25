abstract class HomeState {}

class HomeInitialState extends HomeState{}

class ChangeVisibleState extends HomeState{}

class RegisterLoadingState extends HomeState{}
class RegisterSuccessState extends HomeState{}
class RegisterErrorState extends HomeState{
  final error;

  RegisterErrorState(this.error);
}


class LoginLoadingState extends HomeState{}
class LoginSuccessState extends HomeState{}
class LoginErrorState extends HomeState{
  final error;

  LoginErrorState(this.error);
}


class HomeGetUserDataState extends HomeState {}

class ISAdminSuccessState extends HomeState {}
class ISAdminErrorState extends HomeState {}


class HomeLoadingState extends HomeState {}

class HomeGetUserDataSuccessState extends HomeState {}

class HomeGetUserDataErrorState extends HomeState {
  final error;

  HomeGetUserDataErrorState(this.error);
}

class HomeSetGroupLoadingState extends HomeState {}

class HomeSetGroupSuccessState extends HomeState {}

class HomeSetGroupErrorState extends HomeState {
  final error;

  HomeSetGroupErrorState(this.error);
}

class HomeSetStudentLoadingState extends HomeState{}
class HomeSetStudentSuccessState extends HomeState{}
class HomeSetStudentErrorState extends HomeState {
  final error;

  HomeSetStudentErrorState(this.error);
}

class HomeGetGroupSuccessState extends HomeState {}

class HomeGetGroupErrorState extends HomeState {
  final error;

  HomeGetGroupErrorState(this.error);
}

class HomeGetStudentSuccessState extends HomeState {}

class HomeGetStudentErrorState extends HomeState {
  final error;

  HomeGetStudentErrorState(this.error);
}
class HomePasswordChangeState extends HomeState {}

class SplashMoveSuccessState extends HomeState {}

class ChangeListSizeSuccessState extends HomeState {}


class SetTimeSuccessState extends HomeState {}

class SetDaySuccessState extends HomeState {}

class SetMessageLoadingState extends HomeState{}
class SetMessageSuccessState extends HomeState{}
class SetMessageErrorState extends HomeState
{
  final error;

  SetMessageErrorState(this.error);

}
class GetMessageLoadingState extends HomeState{}
class GetMessageSuccessState extends HomeState{}
class GetMessageErrorState extends HomeState
{
  final error;

  GetMessageErrorState(this.error);

}

class DeleteGroupSuccessState extends HomeState{}


class SetMessageAllGroupLoadingState extends HomeState{}
class SetMessageAllGroupSuccessState extends HomeState{}

class GetMessageAllGroupSuccessState extends HomeState{}