import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:flutter_block_demo_practice/bloc/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
      ),
      body: BlocProvider(
        create: (context) => _loginBloc,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    current.email != previous.email,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocus,
                    decoration: const InputDecoration(
                        hintText: 'Email', border: OutlineInputBorder()),
                    onChanged: (value) {
                      context.read<LoginBloc>().add(EmailChanged(email: value));
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    current.password != previous.password,
                builder: (context, state) {
                  return TextFormField(
                    keyboardType: TextInputType.text,
                    focusNode: passwordFocus,
                    decoration: const InputDecoration(
                        hintText: 'Password', border: OutlineInputBorder()),
                    onChanged: (value) {
                      context
                          .read<LoginBloc>()
                          .add(PasswordChanged(password: value));
                    },
                    onFieldSubmitted: (value) {},
                  );
                },
              ),
              const SizedBox(
                height: 50,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text(state.message.toString())));
                  }
                  if (state.loginStatus == LoginStatus.loading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          const SnackBar(content: Text("submitting")));
                  }

                  if (state.loginStatus == LoginStatus.success) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          const SnackBar(content: Text("Login Successful")));
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (previous, current) => false,
                  builder: (context, state) {
                    return ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(LoginApi());
                        },
                        child: const Text("Login"));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
