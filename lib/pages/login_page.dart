import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/components/my_button.dart';
import 'package:minimal_chat_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  //email and pw text controllers
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  //tap to go to register page
  final void Function()? onTap;


  LoginPage({
    super.key,
    required this.onTap,
  });

  //login method
  void login(BuildContext context) async{
    //auth service
    final authService = AuthService();

    //try login
    try{
      await authService.signInWithEmailPassword(_emailController.text, _passwordController.text);
    }

    //catch any errors
    catch (e) {
      showDialog(context: context, builder: (context) => AlertDialog(
        title: Text(e.toString()),
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

              //space
              const SizedBox(height: 25),

              //login button
              MyButton(
                text:"Login",
                onTap: () => login(context),
              ),

              //space
              const SizedBox(height: 25),

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ", 
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary),
                    ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Register now",
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