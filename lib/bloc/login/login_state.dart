part of 'login_bloc.dart';

enum LoginStatus { inital, success, loading, error }

@immutable
class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginStatus loginStatus;

  LoginState(
      {this.email = '',
      this.password = '',
      this.message = '',
      this.loginStatus = LoginStatus.inital});

  LoginState copyWith(
      {String? email,
      String? password,
      String? message,
      LoginStatus? loginStatus}) {
    return LoginState(
        message: message ?? this.message,
        email: email ?? this.email,
        loginStatus: loginStatus ?? this.loginStatus,
        password: password ?? this.password);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email,password,message,loginStatus];
}

