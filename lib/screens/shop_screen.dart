import 'package:flutter/material.dart';
import 'package:spectare_app_flutter/utils/nav_bar.dart';
import 'package:get/get.dart';
import 'package:spectare_app_flutter/controller/ads_controller.dart';

class ShopScreen extends StatefulWidget {

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  AdsController _controller = Get.put(AdsController());

  void twoXMultiplier(){
    if(_controller.rewardPoint < 30){
      Get.snackbar('Insufficient Coins', 'You don\'t have Sufficient coins balance for this offer');
    }else{
      _controller.multiplier *= 2;
      _controller.rewardPoint -= 30;
      Get.snackbar('Successful', 'Offer Purchased Successfully');
    }

  }

  void fourXMultiplier(){
    if(_controller.rewardPoint < 50){
      Get.snackbar('Insufficient Coins', 'You don\'t have Sufficient coins balance for this offer');
    }else{
      _controller.multiplier *= 4;
      _controller.rewardPoint -= 50;
      Get.snackbar('Successful', 'Offer Purchased Successfully');
    }

  }

  void eightXMultiplier(){
    if(_controller.rewardPoint < 100){
      Get.snackbar('Insufficient Coins', 'You don\'t have Sufficient coins balance for this offer');
    }else{
      _controller.multiplier *= 8;
      _controller.rewardPoint -= 100;
      Get.snackbar('Successful', 'Offer Purchased Successfully');
    }

  }

  void sixteenXMultiplier(){
    if(_controller.rewardPoint < 200){
      Get.snackbar('Insufficient Coins', 'You don\'t have Sufficient coins balance for this offer');
    }else{
      _controller.multiplier *= 16;
      _controller.rewardPoint -= 200;
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
                      GestureDetector(onTap: ()=>twoXMultiplier(), child: shopOption(text: '2x', coins: '30',)),
                      GestureDetector(onTap: ()=>fourXMultiplier(), child: shopOption(text: '4x', coins: '50',)),
                      GestureDetector(onTap: ()=>eightXMultiplier(), child: shopOption(text: '8x', coins: '100',)),
                      GestureDetector(onTap: ()=>sixteenXMultiplier(), child: shopOption(text: '16x', coins: '200',),)
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

  final String text;
  final String coins;

  const shopOption({super.key, required this.text, required this.coins});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // // crossAxisAlignment: CrossAxisAlignment.,
      children: [
        Text('$text Multiplier', style: TextStyle(fontSize: 18.0, color: Color(0xff919293),fontWeight: FontWeight.bold),),
        SizedBox(width: 40.0,),
        Expanded(
          child: ListTile(
            tileColor: Color(0xff393946),
            textColor: Color(0xff919293),
            title: Text('Buy for $coins coins'),
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
