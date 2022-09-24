import 'package:odc/data/models/login_model.dart';

abstract class LoginState{}
class LoginInitialState extends LoginState{}
class ShowPasswordState extends LoginState{}
class LoginLoading extends LoginState{}
class LoginSuccessState extends LoginState{
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginState{}