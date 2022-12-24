
import 'package:flutter/material.dart';
import '../consetants.dart';
import '../custom_elevated_button.dart';
import 'begin_page2.dart';


class BeginPage1 extends StatelessWidget {
  const BeginPage1({Key? key}) : super(key: key);

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
                    color:KPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),)
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome to ",style: TextStyle(
                color: Colors.grey[500],
              ),),
              Text("BEKO, ",style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,

              ),),
              Text("Let's shop! ",style: TextStyle(
                color: Colors.grey[500],
              ),),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 65, vertical: 20),
            child: Row(
              children: [
                Image(image: AssetImage("assets/images/smartphone.png")) ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Container(
              width: 150,
              height: 100,

              child: Row(

                children: [
                  Container(
                    width: 18,
                    height: 5,
                    decoration: BoxDecoration(
                      color: KPrimaryColor,
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
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomElevatedButton(nextScreen:BeginPage2() ,text: "Continue",)
        ],
      ),
    );
  }
}
