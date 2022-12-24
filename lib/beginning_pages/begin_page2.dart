import 'package:flutter/material.dart';
import '../consetants.dart';
import '../custom_elevated_button.dart';
import 'begin_Page3.dart';



class BeginPage2 extends StatelessWidget {
  const BeginPage2({Key? key}) : super(key: key);

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
              Text("We help people connect Markets \n     around United State of USA ",style: TextStyle(
                color: Colors.grey[500],
              ),),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top:30, left: 65),
            child: Row(
              children: [
                Image(image: AssetImage("assets/images/shopping-cart.png")) ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150, ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Container(
                    width: 18,
                    height: 5,
                    decoration: BoxDecoration(
                      color: KPrimaryColor,
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
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: CustomElevatedButton(nextScreen: BeginPage3(),text: "Continue",),
          )
        ],
      ),
    );
  }
}
