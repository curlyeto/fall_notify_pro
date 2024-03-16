import 'package:fall_notify_pro/constant.dart';
import 'package:fall_notify_pro/custom/input/customTextField.dart';
import 'package:fall_notify_pro/pages/auth/register.dart';
import 'package:fall_notify_pro/pages/bottomNavigation/bottomNavigationBar.dart';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange.shade900,
                  Colors.orange.shade800,
                  Colors.orange.shade400
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1000), child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),)),
                  const SizedBox(height: 10,),
                  FadeInUp(duration: const Duration(milliseconds: 1300), child: const Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 60,),
                      FadeInUp(duration: const Duration(milliseconds: 1400), child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [BoxShadow(
                                color: Color.fromRGBO(225, 95, 27, .3),
                                blurRadius: 20,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: <Widget>[
                            // Container(
                            //   padding: EdgeInsets.all(10),
                            //   decoration: BoxDecoration(
                            //       border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                            //   ),
                            //   child:  TextField(
                            //     controller: loginController,
                            //     obscureText: true,
                            //     decoration: const InputDecoration(
                            //         hintText: "Email",
                            //         hintStyle: TextStyle(color: Colors.grey),
                            //         border: InputBorder.none
                            //     ),
                            //   ),
                            // ),
                            CustomTextField(
                              controller: emailController,
                              hintText: "Email",
                              showIcon: true,
                              icon: const Icon(Icons.email,color: Colors.grey,),
                            ),
                            CustomTextField(
                              controller: passwordController,
                              hintText: "Password",
                              showIcon: true,
                              icon: const Icon(Icons.lock,color: Colors.grey,),
                            ),

                          ],
                        ),
                      )),
                      const SizedBox(height: 40,),
                      FadeInUp(duration: const Duration(milliseconds: 1500), child: const Text("Forgot Password?", style: TextStyle(color: Colors.grey),)),
                      const SizedBox(height: 40,),
                      FadeInUp(duration: const Duration(milliseconds: 1600), child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const AppNavigationPage(),
                            ),
                          );
                        },
                        height: 50,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        color: AppColor.appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        // decoration: BoxDecoration(
                        // ),
                        child: const Center(
                          child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )),
                      SizedBox(height: 50,),
                      GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                          child: FadeInUp(duration: const Duration(milliseconds: 1500), child: const Text("Don't You Have an Account ? Register", style: TextStyle(color: Colors.grey),))),

                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
