import 'package:flutter/material.dart';
import 'package:spectare_app_flutter/utils/nav_bar.dart';

class TransactionsScreen extends StatefulWidget {

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
