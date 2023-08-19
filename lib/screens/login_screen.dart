import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_techer/cubit/cubit.dart';
import 'package:flutter_techer/cubit/state.dart';
import 'package:flutter_techer/screens/home_screen.dart';
import 'package:flutter_techer/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {

          if(state is LoginSuccessState){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('please login , and continue.',
                        style: TextStyle(color: Colors.green, fontSize: 20)),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          label: Text('Email Address'),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: HomeCubit.get(context).isVisible,
                      decoration: InputDecoration(
                          label: Text('Password'),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.green,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                HomeCubit.get(context).changeVisible();
                              },
                              icon: HomeCubit.get(context).isVisible
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off)),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          'Dont have an account ? ',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterScreen()));
                            },
                            child: Text(
                              'Register',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            ))
                      ],
                    ),
                     state is LoginLoadingState ?CircularProgressIndicator(): MaterialButton(
                      onPressed: () {
                        HomeCubit.get(context).login(
                            email: emailController.text,
                            password: passwordController.text);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
