import 'package:flutter/material.dart';

import 'consetants.dart';

class CustomElevatedButton extends StatelessWidget {


  CustomElevatedButton({Key? key, required this.text, required this.nextScreen}) : super(key: key);
  final String text;
  final Widget nextScreen;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.only(top :20, left: 110 , right: 110 , bottom: 20)),
            backgroundColor: MaterialStateProperty.all(KPrimaryColor) ,
            shape: MaterialStateProperty.all(

                RoundedRectangleBorder(
                    borderRadius:BorderRadius.all(Radius.circular(30))
                )
            ) ),
        onPressed: () {

          Navigator.push(context, MaterialPageRoute(builder: (context)=>nextScreen));
        },
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        )
    );
  }
}
