import 'package:fall_notify_pro/pages/component/bodyPage.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
class HomePageHasDevice extends StatefulWidget {
  const HomePageHasDevice({Key? key}) : super(key: key);

  @override
  State<HomePageHasDevice> createState() => _HomePageHasDeviceState();
}

class _HomePageHasDeviceState extends State<HomePageHasDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyPage(
        title: "Home Page",
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("They can scan the qr code and detect your status",style: Theme.of(context).textTheme.bodyLarge,),
              SizedBox(height: 50,),
              Center(
                child: SizedBox(
                  height: 150,
                  child: PrettyQrView.data(
                    data: '{"user_id":1,"name":"John","surname":"Kenny","age":"56"}',

                    decoration: const PrettyQrDecoration(
                      image: PrettyQrDecorationImage(
                        image: AssetImage('images/flutter.png'),
                      ),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("People can detect my status",style: Theme.of(context).textTheme.bodyLarge,),
              Container(
                height: MediaQuery.of(context).size.height*0.7,
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context,index){
                      return  Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                        ),
                        child: ListTile(
                          leading: Image.network("https://wcc.ca/wp-content/uploads/2023/05/wcc-blog-How-long-does-it-take-to-become-a-nurse.jpg",width: 60,
                          fit: BoxFit.cover,),
                          title: Text("Jessica Hernandez"),
                          trailing:  IconButton(
                            icon: Icon(Icons.call),
                            onPressed: () {},
                          ),
                        ),
                      );
                    }),
              )

            ],
          ),
        ),
      ),
    );
  }
}
