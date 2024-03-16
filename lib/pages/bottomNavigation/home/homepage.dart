import 'package:fall_notify_pro/constant.dart';
import 'package:fall_notify_pro/pages/component/bodyPage.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BodyPage(
        title: "Home Page",
        body:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.add,color: Colors.white,),
                    label: Text("Add Relatives",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.appColor
                    ),
                  ),
                ],
              ),
              Text("My Relatives",style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
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
                          leading: Image.asset("assets/images/old-man.jpg"),
                          subtitle: Text("1400 Barry Downe Road",style: Theme.of(context).textTheme
                              .bodySmall!
                              .copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),),
                          title: Text("Robbert Ken , 56"),
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
