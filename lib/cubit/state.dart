abstract class HomeState {}

class HomeInitialState extends HomeState{}

class ChangeVisibleState extends HomeState{}

class RegisterLoadingState extends HomeState{}
class RegisterSuccessState extends HomeState{}
class RegisterErrorState extends HomeState{
  final error;

  RegisterErrorState(this.error);
}