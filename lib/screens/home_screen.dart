import 'package:flutter/material.dart';
import 'package:spectare_app_flutter/controller/ads_controller.dart';
import 'package:get/get.dart';
import 'package:spectare_app_flutter/utils/nav_bar.dart';
import 'package:scratcher/scratcher.dart';
import 'dart:math';
import 'package:get_storage/get_storage.dart';

class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AdsController _controller = Get.put(AdsController());

  // String username = storage.read("username");
  double _opacity = 0;
  var winScratchCoins = 0;

  GetStorage storage = GetStorage();



  void randomCoinGenerate(){
    var random = (Random().nextInt(10) + 1);
    if(random == 1){
      winScratchCoins = 10;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*1;
      _controller.multiplier +=0.2*1;
      _controller.percentage += 0.1*1;
      _controller.credit += 10*1;
    }else if(random == 2){
      winScratchCoins = 20;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*2;
      _controller.multiplier +=0.2*2;
      _controller.percentage += 0.1*2;
      _controller.credit += 10*2;
    }else if(random == 3){
      winScratchCoins = 30;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*3;
      _controller.multiplier +=0.2*3;
      _controller.percentage += 0.1*3;
      _controller.credit += 10*3;
    }else if(random == 4){
      winScratchCoins = 40;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*4;
      _controller.multiplier +=0.2*4;
      _controller.percentage += 0.1*4;
      _controller.credit += 10*4;
    }else if(random == 5){
      winScratchCoins = 50;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*5;
      _controller.multiplier +=0.2*5;
      _controller.percentage += 0.1*5;
      _controller.credit += 10*5;
    }else if(random == 6){
      winScratchCoins = 60;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*6;
      _controller.multiplier +=0.2*6;
      _controller.percentage += 0.1*6;
      _controller.credit += 10*6;
    }else if(random == 7){
      winScratchCoins = 70;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*7;
      _controller.multiplier +=0.2*7;
      _controller.percentage += 0.1*7;
      _controller.credit += 10*7;
    }else if(random == 8){
      winScratchCoins = 80;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*8;
      _controller.multiplier +=0.2*8;
      _controller.percentage += 0.1*8;
      _controller.credit += 10*8;
    }else if(random == 9){
      winScratchCoins = 90;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*9;
      _controller.multiplier +=0.2*9;
      _controller.percentage += 0.1*9;
      _controller.credit += 10*9;
    }else if(random == 10){
      winScratchCoins = 100;
      _controller.rewardPoint +=winScratchCoins;
      _controller.netIncome +=0.5*10;
      _controller.multiplier +=0.2*10;
      _controller.percentage += 0.1*10;
      _controller.credit += 10*10;
    }

  }

  scratchCardDialog(context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'You\'ve won a Scratch Card',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          content: StatefulBuilder(
            builder: (context, StateSetter setState){
              return Scratcher(
                accuracy: ScratchAccuracy.low,
                brushSize: 50,
                threshold: 25,
                onThreshold: (){
                  setState((){
                    _opacity = 1;
                    randomCoinGenerate();
                  });
                },
                image: Image.asset("assets/coins.jpg"),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: _opacity,
                  child: Container(
                    height: 300,
                    width: 300,
                    alignment: Alignment.center,
                    child: Text(
                      '$winScratchCoins Coins',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              );

            },
          ),
        );
      }
    );

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(
                            color: Color(0xff393946),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(Icons.menu,size: 40,color: Colors.white,),
                      ),
                    ),
                    Text(
                      'Spectare',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 3.0,
                    color: Color(0xff393946),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Hi,',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 3.0,
                    color: Color(0xff393946),
                  ),
                ),

                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coins',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xff393946),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '${_controller.rewardPoint}',
                                style: TextStyle(
                                  color: Color(0xff919293),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Percentage',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xff393946),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.only(left: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  '${_controller.percentage.toStringAsFixed(2)} %',
                                  style: TextStyle(
                                    color: Color(0xff919293),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Multiplier',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xff393946),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: EdgeInsets.only(left: 5),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    '${_controller.multiplier.toStringAsFixed(2)} %',
                                    style: TextStyle(
                                      color: Color(0xff919293),
                                      fontSize: 16,
                                  ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 3.0,
                    color: Color(0xff393946),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Color(0xff393946),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _controller.loadAds();
                              });

                            },
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('assets/playbutton.png'),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Tap to Watch AD',
                            style: TextStyle(
                                color: Color(0xff919293),
                                fontSize: 25
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 3.0,
                    color: Color(0xff393946),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: MaterialButton(
                    height: 50,
                    minWidth: double.infinity,
                    color: Color(0xff393946),
                    child: Text(
                      'Get a Scratch Card',
                      style: TextStyle(
                          color: Color(0xff919293),
                          fontSize: 25
                      ),
                    ),
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide.none,
                    ),

                    onPressed: ()=> scratchCardDialog(context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Leaderboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 3.0,
                    color: Color(0xff393946),
                  ),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xff393946),
                      ),
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    child: Text(
                      '${ storage.read("username")}:  ${_controller.credit} credits',
                      style: TextStyle(
                          color: Color(0xff919293),
                          fontSize: 20
                      ),
                    ),
                  ),

                ),
                SizedBox(height: 5,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 3.0,
                    color: Color(0xff393946),
                  ),
                ),
                SizedBox(height: 5,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    '5000 Active Users',
                    style: TextStyle(
                        color: Color(0xff919293),
                        fontSize: 20
                    ),
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
