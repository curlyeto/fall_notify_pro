import 'package:fall_notify_pro/constant.dart';
import 'package:fall_notify_pro/custom/input/customTextField.dart';
import 'package:fall_notify_pro/pages/bottomNavigation/bottomNavigationBar.dart';
import 'package:fall_notify_pro/pages/component/bodyPage.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
class GetUserInfo extends StatefulWidget {
  const GetUserInfo({Key? key}) : super(key: key);

  @override
  State<GetUserInfo> createState() => _GetUserInfoState();
}

class _GetUserInfoState extends State<GetUserInfo> {
  TextEditingController nameController= TextEditingController();
  TextEditingController surnameController= TextEditingController();
  TextEditingController ageController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BodyPage(
        title: "Personal Info",
        body: SingleChildScrollView(
          child:   Column(children: [
            CustomTextField(
              controller: nameController,
              hintText: "Name",
            ),
            CustomTextField(
              controller: surnameController,
              hintText: "Surname",
            ),
            CustomTextField(
              controller: ageController,
              hintText: "Age",
            ),
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
                child: Text("Continue", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            )),
          ],),
        ),
      ),
    );
  }
}
