import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
class BodyPage extends StatelessWidget {
  final Widget? body;
  final String? title;
  const BodyPage({Key? key,this.body,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // SizedBox(height: 60,),
          // Image.asset("assets/images/4911367.jpg",height: 50,width: 50,),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FadeInUp(duration: const Duration(milliseconds: 1000), child: Text(title!, style: const TextStyle(color: Colors.white, fontSize: 24),)),

              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: body,
              ),
            ),
          )
        ],
      ),
    );
  }
}
