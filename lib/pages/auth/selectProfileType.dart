import 'package:fall_notify_pro/pages/auth/login.dart';
import 'package:fall_notify_pro/pages/component/bodyPage.dart';
import 'package:fall_notify_pro/pages/deviceUser/connectingDevice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SelectProfileType extends StatefulWidget {
  const SelectProfileType({Key? key}) : super(key: key);

  @override
  State<SelectProfileType> createState() => _SelectProfileTypeState();
}

class _SelectProfileTypeState extends State<SelectProfileType> {
  Future<void> saveData()async{
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("hasDevice", false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveData();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BodyPage(
        title: "Select Profile",
        body:
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  Image.asset("assets/images/4911367.jpg"),
                  SizedBox(height: 20,),
                  ListTile(
                    onTap: () async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool("hasDevice", true);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>  const ConnectionDevice(),
                        ),
                      );
                    },
                    leading: Icon(Icons.devices_sharp),
                    title: Text("I HAVE DEVICE"),
                    trailing: Icon(Icons.arrow_forward_ios,size: 20,),
                  ),
                  ListTile(
                    onTap: ()async{
                      final SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setBool("hasDevice", false);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    leading: Icon(Icons.person),
                    title: Text("I DETECT MY RELATIVES"),
                    trailing: Icon(Icons.arrow_forward_ios,size: 20,),
                  ),

            ],
          ),
        ),
      ),
    );
  }
}
