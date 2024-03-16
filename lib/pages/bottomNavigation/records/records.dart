import 'package:fall_notify_pro/constant.dart';
import 'package:fall_notify_pro/pages/component/bodyPage.dart';
import 'package:flutter/material.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  State<RecordsPage> createState() => _HomePageState();
}

class _HomePageState extends State<RecordsPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:BodyPage(
        title: "Records Page",
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("My Relatives Status"),
            Container(
              height: MediaQuery.of(context).size.height*0.7,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context,index){
                return  Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: index==0?Color(0xFFFF5963):Color(0xFF39D2C0),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Robbert Ken , 56',
                          ),
                          Text(
                            '1221 Notre Dame avenue',
                          ),
                          Text(
                            'Today 01:35 PM',
                          ),
                        ],
                      ),
                      index==0?
                          Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.location_on),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: Icon(Icons.call),
                                onPressed: () {},
                              )
                            ],
                          )
                          :Icon(
                        Icons.thumb_up
                      )
                    ],
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
