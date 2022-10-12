import 'package:flutter/material.dart';
import 'package:spectare_app_flutter/utils/nav_bar.dart';
import 'package:get/get.dart';
import 'package:spectare_app_flutter/controller/ads_controller.dart';

class CreditShopScreen extends StatefulWidget {

  @override
  State<CreditShopScreen> createState() => _CreditShopScreenState();
}

class _CreditShopScreenState extends State<CreditShopScreen> {
  AdsController _controller = Get.put(AdsController());

  void oneXCredits(){
    if(_controller.multiplier < 0.2){
      Get.snackbar('Insufficient Multiplier', 'You don\'t have Sufficient multiplier balance for this offer');
    }else{
      _controller.credit += 100;
      _controller.multiplier -= 0.2;
      Get.snackbar('Successful', 'Offer Purchased Successfully');
    }

  }

  void twoXCredits(){
    if(_controller.multiplier < 0.4){
      Get.snackbar('Insufficient Multiplier', 'You don\'t have Sufficient multiplier balance for this offer');
    }else{
      _controller.credit += 240;
      _controller.multiplier -= 0.2*2;
      Get.snackbar('Successful', 'Offer Purchased Successfully');
    }

  }

  void fourXCredits(){
    if(_controller.multiplier < 0.8){
      Get.snackbar('Insufficient Multiplier', 'You don\'t have Sufficient multiplier balance for this offer');
    }else{
      _controller.credit += 480;
      _controller.multiplier -= 0.2*4;
      Get.snackbar('Successful', 'Offer Purchased Successfully');
    }

  }

  void eightXCredits(){
    if(_controller.multiplier < 0.16){
      Get.snackbar('Insufficient Multiplier', 'You don\'t have Sufficient multiplier balance for this offer');
    }else{
      _controller.credit += 960;
      _controller.multiplier -= 0.16;
      Get.snackbar('Successful', 'Offer Purchased Successfully');
    }

  }

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
                  // width: MediaQuery.of(context).size.width,

                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                      color: Color(0xff393946),
                      borderRadius: BorderRadius.circular(6)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        child: Text('Shop', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(onTap: ()=>oneXCredits(), child: shopOption(credit: '100', multiplier: '0.02',)),
                      GestureDetector(onTap: ()=>twoXCredits(), child: shopOption(credit: '240', multiplier: '0.04',)),
                      GestureDetector(onTap: ()=>fourXCredits(), child: shopOption(credit: '480', multiplier: '0.08',)),
                      GestureDetector(onTap: ()=>eightXCredits(), child: shopOption(credit: '960', multiplier: '0.16',),)
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

class shopOption extends StatelessWidget {

  final String credit;
  final String multiplier;

  const shopOption({super.key, required this.credit, required this.multiplier});


  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // // crossAxisAlignment: CrossAxisAlignment.,
      children: [
        Text('$credit Credits', style: TextStyle(fontSize: 18.0, color: Color(0xff919293),fontWeight: FontWeight.bold),),
        SizedBox(width: 40.0,),
        Expanded(
          child: ListTile(
            tileColor: Color(0xff393946),
            textColor: Color(0xff919293),
            title: Text('Buy for $multiplier multiplier'),
            shape: Border(
              bottom: BorderSide(
                  color: Color(0xff919293),
                  width: 5
              ),
            ),
          ),
        )
      ],
    );
  }
}
