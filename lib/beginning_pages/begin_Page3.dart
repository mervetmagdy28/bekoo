import 'package:flutter/material.dart';

import '../consetants.dart';
import '../custom_elevated_button.dart';
import '../login_page.dart';

class BeginPage3 extends StatelessWidget {
  const BeginPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BEKO",style: TextStyle(
                    color: KPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("BEKO the easy way to shop. \n         stay at home with us",style: TextStyle(
                color: Colors.grey[500],
              ),),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top:40, left: 70),
            child: Row(
              children: [
                Image(image: AssetImage("assets/images/shopping-bag.png")) ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 20),
            child: Row(

              children: [

                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),

                Container(
                  width: 18,
                  height: 5,
                  decoration: BoxDecoration(
                    color: KPrimaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: CustomElevatedButton(nextScreen: LogInPage(),text: "Continue",),

          )
        ],
      ),
    );
  }
}



