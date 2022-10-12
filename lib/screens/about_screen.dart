import 'package:flutter/material.dart';
import 'package:spectare_app_flutter/utils/nav_bar.dart';

class AboutScreen extends StatelessWidget {

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
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  width: double.infinity,
                  color: Color(0xff393946),

                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text('About', style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                        ),
                        Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                          style: TextStyle(
                            color: Color(0xff919293),
                          ),

                        )
                      ],
                    ),


                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
