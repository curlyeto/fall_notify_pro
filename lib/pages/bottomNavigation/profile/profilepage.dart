import 'package:fall_notify_pro/pages/auth/selectProfileType.dart';
import 'package:fall_notify_pro/pages/component/bodyPage.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _HomePageState();
}

class _HomePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:BodyPage(
        title: "Profile Page",
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                title: Text("Jessica Hernandez"),
                subtitle: Text(
                  'elaine.edwards@google.com',
                  style: Theme.of(context).textTheme
                      .bodySmall!
                      .copyWith(
                    fontFamily: 'Outfit',
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                leading:  Container(
                  child:ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1592520113018-180c8bc831c9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTI3fHxwcm9maWxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60',
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: Text("Edit Profile"),
                leading:  Icon(Icons.settings),
                trailing: Icon(Icons.arrow_forward_ios,size: 20,),
              ),
              ListTile(
                onTap: (){

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>  const SelectProfileType(),
                    ),
                  );
                },
                title: Text("Log Out"),
                leading:  Icon(Icons.logout),
              )
            ],
          ),
        ),
      ),
    );
  }
}
