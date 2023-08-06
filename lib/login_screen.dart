import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

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
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    label: Text('Password'),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.green,
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Dont have an account ? ',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ))
                ],
              ),
              MaterialButton(
                onPressed: () {},
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
  }
}
