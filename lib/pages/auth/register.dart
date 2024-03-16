import 'package:fall_notify_pro/constant.dart';
import 'package:fall_notify_pro/custom/input/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegisterPage> {
  TextEditingController nameController= TextEditingController();
  TextEditingController surnameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FadeInUp(duration: const Duration(milliseconds: 1000), child: const Text("Register", style: TextStyle(color: Colors.white, fontSize: 40),)),

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
                  child: ListView(
                    children: <Widget>[

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
                            CustomTextField(
                              controller: nameController,
                              hintText: "Name",
                            ),
                            CustomTextField(
                              controller: surnameController,
                              hintText: "Surname",
                            ),
                            CustomTextField(
                              controller: emailController,
                              hintText: "Email",
                            ),
                            CustomTextField(
                              controller: phoneController,
                              hintText: "Phone Number",
                            ),
                            CustomTextField(
                              controller: passwordController,
                              hintText: "Password",
                            ),

                          ],
                        ),
                      )),

                      const SizedBox(height: 40,),
                      FadeInUp(duration: const Duration(milliseconds: 1600), child: MaterialButton(
                        onPressed: () {},
                        height: 50,
                        // margin: EdgeInsets.symmetric(horizontal: 50),
                        color: AppColor.appColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),

                        ),
                        // decoration: BoxDecoration(
                        // ),
                        child: const Center(
                          child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      )),


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
