import 'package:flutter/material.dart';
import 'package:spectare_app_flutter/utils/nav_bar.dart';
import 'package:spectare_app_flutter/controller/ads_controller.dart';
import 'package:get/get.dart';

class EarningScreen extends StatefulWidget {

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  AdsController _controller = Get.put(AdsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        body: Container(
          color: Color(0xff1E1C37),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Color(0xff393946),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(Icons.menu,size: 40,color: Colors.white,),
                      ),
                      Text(
                        'Spectare',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ]
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 3.0,
                    color: Color(0xff393946),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  width: double.infinity,
                  color: Color(0xff393946),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Text('Earnings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 20,),
                      Text('Net Income', style: TextStyle(fontSize: 20, color: Color(0xff919293),),),
                      SizedBox(height: 10,),
                      Text('${_controller.netIncome} euro', style: TextStyle(fontSize: 25, color: Color(0xff919293)),),
                      SizedBox(height: 20,),
                      Text('Withdrawn', style: TextStyle(fontSize: 20, color: Color(0xff919293),),),
                      SizedBox(height: 10,),
                      Text('${_controller.withdrawn} euro', style: TextStyle(fontSize: 25, color: Color(0xff919293)),),
                      SizedBox(height: 20,),
                      Text('Avaibale for Withdrawl', style: TextStyle(fontSize: 20, color: Color(0xff919293),),),
                      SizedBox(height: 10,),
                      Text('${_controller.netIncome - _controller.withdrawn}', style: TextStyle(fontSize: 25, color: Color(0xff919293)),),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
