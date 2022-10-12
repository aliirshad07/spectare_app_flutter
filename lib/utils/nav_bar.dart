import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spectare_app_flutter/screens/home_screen.dart';
import 'package:spectare_app_flutter/screens/profile_screen.dart';
import 'package:spectare_app_flutter/screens/earnings_screen.dart';
import 'package:spectare_app_flutter/screens/signup_screen.dart';
import 'package:spectare_app_flutter/screens/transaction_screen.dart';
import 'package:spectare_app_flutter/screens/shop_screen.dart';
import 'package:spectare_app_flutter/screens/instructions_screen.dart';
import 'package:spectare_app_flutter/screens/about_screen.dart';
import 'package:spectare_app_flutter/screens/credit_shop_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:spectare_app_flutter/screens/reward_screen.dart';


class NavBar extends StatelessWidget {
  GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(

      backgroundColor: Color(0xff1E1C37),
      child: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Color(0xff1E1C37),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
            child: Divider(
              thickness: 3.0,
              color: Color(0xff393946),
            ),
          ),
          drawerItem(title: 'Home', icon: Icons.home, onTap: ()=>Get.to(HomeScreen()),),
          drawerItem(title: 'Profile', icon: Icons.person, onTap: ()=>Get.to(ProfileScreen()),),
          drawerItem(title: 'Earnings', icon: Icons.money, onTap: ()=>Get.to(EarningScreen())),
          drawerItem(title: 'Shop', icon: Icons.credit_card, onTap: ()=>Get.to(ShopScreen())),
          drawerItem(title: 'Credit Shop', icon: Icons.credit_card, onTap: ()=>Get.to( CreditShopScreen())),
          drawerItem(title: 'Transactions', icon: Icons.wallet_rounded, onTap: ()=>Get.to(TransactionsScreen())),
          drawerItem(title: 'Instructions', icon: Icons.integration_instructions, onTap: ()=>Get.to(InstructionsScreen())),
          drawerItem(title: 'About', icon: Icons.info_outlined, onTap: ()=>Get.to(AboutScreen())),
          drawerItem(title: 'Reward', icon: Icons.euro, onTap: ()=>Get.to(RewardScreen())),
          drawerItem(title: 'Logout', icon: Icons.logout, onTap: (){
            Get.offAll(SignUpSCreen());
          }),

        ],
      ),

    );
  }
}

class drawerItem extends StatelessWidget {

  final String title;
  final IconData icon;
  final Function() onTap;

  const drawerItem({super.key, required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5, left: 20, right: 20),
      child: ListTile(
        onTap: onTap,
        tileColor: Color(0xff393946),
        title: Text(title, style: TextStyle(fontSize: 15),),
        textColor: Color(0xff919293),
        leading: Icon(icon, color: Color(0xff919293), size: 30,),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}
