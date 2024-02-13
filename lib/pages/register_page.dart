import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/components/my_button.dart';
import 'package:minimal_chat_app/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  //email and pw text controllers
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confirmPasswordController = new TextEditingController();

  //tap to go to login page
  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,
  });

  void register( BuildContext context){
    //get auth service
    final _auth = AuthService();

    //password match -> create user
    if (_passwordController.text == _confirmPasswordController.text){
      try{
        _auth.signUpWithEmailPassword(_emailController.text, _passwordController.text);
      }catch (e) {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ));
      }
    } else{
      showDialog(context: context, builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(
                Icons.message,
                size: 60,
                color: Theme.of(context).colorScheme.primary,
              ),

              //space
              const SizedBox(height: 50),

              //welcome back message
              Text(
                "Welcome Back!", 
                style: TextStyle(fontSize: 16, color: Theme.of(context).colorScheme.primary),
              ),

              //space
              const SizedBox(height: 25),

              //email textfield
              MyTextField(
                hintText: "Email",
                obscureText: false,
                controller: _emailController,
              ),

              //space
              const SizedBox(height: 10),
              //pw textfield
              MyTextField(
                hintText: "Password",
                obscureText: true,
                controller: _passwordController,
              ),
              //confirm password
              const SizedBox(height: 10),
              //pw textfield
              MyTextField(
                hintText: "Confirm Password",
                obscureText: true,
                controller: _confirmPasswordController,
              ),
              //space
              const SizedBox(height: 25),

              //login button
              MyButton(
                text:"Register",
                onTap: () => register(context),
                
              ),

              //space
              const SizedBox(height: 25),

              //login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary),
                    ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                      ),
                  ),
                ],
              )
            ]
          ),
        ),
    );
  }
}