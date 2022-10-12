import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:spectare_app_flutter/controller/ads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spectare_app_flutter/screens/signup_screen.dart';
import 'dart:math';
import 'package:spectare_app_flutter/main.dart';

class RewardScreen extends StatefulWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen> {

  AdsController _controller = Get.put(AdsController());
  MyApp myApp = MyApp();
  SignUpSCreen obj = SignUpSCreen();
  Duration duration = Duration();
  Timer? timer;
  bool countDown = true;
  Color? color;
  Function? function;
  GetStorage storage =GetStorage();

  Widget buildTime(){
    String twoDigets(int n)=>n.toString().padLeft(2, '0');
    final minutes = twoDigets(duration.inMinutes.remainder(60));
    final seconds = twoDigets(duration.inSeconds.remainder(60));
    final hours = twoDigets(duration.inHours);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        buildTimeCard(time: hours, header: 'HOURS'),
        SizedBox(width: 8,),
        buildTimeCard(time: minutes, header: 'MINUTES'),
        SizedBox(width: 8,),
        buildTimeCard(time: seconds, header: 'SECONDS'),



      ],
    );
  }
  Widget buildTimeCard({required String time, required String header}){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
          ),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 24,),
        Text(header, style: TextStyle(color: Colors.white),),
      ],
    );
  }
  Duration countDownDuration = Duration(seconds: 60);

  void reset(){
    if(countDown){
      setState(() {
        duration = countDownDuration;
      });
    }else{
      setState(() {
        duration = Duration();
      });
    }
  }

  void addTime(){
    final addsecond = 1;
    setState(() {
      final seconds = duration.inSeconds - addsecond;
      if(seconds<0){
        timer?.cancel();
        setState(() {
          color = Colors.blue;
        });


      }else{
        duration = Duration(seconds: seconds);
        color = Colors.white;
      }

    });
  }

  void stratTimer(){
    timer = Timer.periodic(Duration(seconds: 1), (_)=>addTime());

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stratTimer();
    reset();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff26133C),
        body: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: buildTime(),
              ),
              SizedBox(height: 20,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 50,
                minWidth: 60,
                color: color,
                onPressed: (){
                  if(color==Colors.blue){
                    // var random = (Random().nextInt(myApp.user.length) + 1);
                    // var winner = myApp.user.elementAt(random);
                    showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: Align(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    'Congratulations!',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'winner',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Text(
                                    'You get 100 EURO',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  )
                                ],
                              )
                            ),
                          );
                        }
                    );
                    _controller.netIncome+=100;
                    setState(() {
                      _controller.multiplier = 0;
                      _controller.credit = 0;
                      _controller.rewardPoint = 0;
                      _controller.percentage = 0;
                      
                    });

                  }else{
                    Get.snackbar("No Reward", "7 days time is completed yet");
                  }


                },
                child: Text(
                  'See the winner',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
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
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: ListView.builder(
                    itemBuilder: (context, index){
                      return Text(
                            'username',
                            style: TextStyle(
                                color: Color(0xff919293),
                                fontSize: 20
                            ),

                      );
                    },
                  )
                ),

              )



            ],
          ),
        ),
      ),
    );
  }
}
