import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    // on<LoginEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
    on<EmailChanged>(_onEmailChange);
    on<PasswordChanged>(_onPasswordChange);
    on<LoginApi>(_loginApi);
  }

  void _onEmailChange(EmailChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChange(PasswordChanged event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _loginApi(LoginApi event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginStatus: LoginStatus.loading));
    Map data = {'email': state.email, 'password': state.password};
    
    try {
      var url = Uri.parse('https://reqres.in/api/login');
      final response = await http.post(url, body: data);
      var json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        emit(state.copyWith(
            loginStatus: LoginStatus.success, message: 'Login Successful'));
      } else {
        emit(state.copyWith(
            loginStatus: LoginStatus.error, message: json['error']));
      }
    } catch (e) {
      emit(state.copyWith(message: e.toString()));
    }
  }
}
