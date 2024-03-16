import 'package:fall_notify_pro/constant.dart';
import 'package:fall_notify_pro/pages/component/bodyPage.dart';
import 'package:fall_notify_pro/pages/deviceUser/getUserInfo.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'package:connectivity_plus/connectivity_plus.dart';
class ConnectionDevice extends StatefulWidget {
  const ConnectionDevice({Key? key}) : super(key: key);

  @override
  State<ConnectionDevice> createState() => _ConnectionDeviceState();
}

class _ConnectionDeviceState extends State<ConnectionDevice> {
  bool? connection=false;

 ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }
  

  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      body:BodyPage(
        title: "Conenction Device",
        body: SingleChildScrollView(
          child:   connection! ?connected():noConnection(),
          // child:   screen,
        ),
      ),
    );
  }
  Widget connected(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Lottie.asset('assets/animations/connected.json')),
        SizedBox(height: 20,),
        Text("You connected your phone to fall notify pro. Contunue and use the app"),
        SizedBox(height: 40,),
        TextButton(
          onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const GetUserInfo(),
              ),
            );
          },
          child: Text("Continue",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),
          style: TextButton.styleFrom(
              backgroundColor: AppColor.appColor
          ),
        ),
      ],
    );
  }
  Widget noConnection (){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Lottie.asset('assets/animations/bluetooth-connection.json',height: 200)),

     
        Text("Device List",style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(
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
                    onTap: (){
                      setState(() {
                        connection=true;
                      });
                    },
                    leading: SvgPicture.asset(
                      index==0?"assets/svg/iot.svg":"assets/svg/cellPhone.svg",
                      color: index==0?Colors.blue:null,
                      height: 40,
                    ),
                    title: Text(index==0?"Fall Notify Pro":"Iphone 14 Pro"),
                    trailing:  IconButton(
                      icon: Icon(Icons.arrow_forward_ios,size: 18,),
                      onPressed: () {},
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}

