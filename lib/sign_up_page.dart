import 'package:e_commerce_flutter/show_snank_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../consetants.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void initState() {
    super.initState();
  }
  String? email;

  String? password;


  String? confirmPassword;

  bool isLoading = false;
  final emailControllor= TextEditingController();
  final passwordControllor= TextEditingController();
  final confirmPasswordControllor= TextEditingController();


  void dispose(){
    emailControllor.dispose();
    passwordControllor.dispose();
    confirmPasswordControllor.dispose();
    super.dispose();
  }

  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  Future Signup()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailControllor.text.trim(), password: passwordControllor.text.trim());

  }
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailControllor.text.trim());
  }
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          body:Form(
            key: _globalKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                          child: Icon(Icons.arrow_back_ios,color: Colors.grey[500],),
                        ),

                        Center(
                          child: Text("SIGN UP", style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 16
                          ),),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Complete profile", style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("complete your profile or your account \n                  with social media" ,style: TextStyle(
                            color: Colors.grey[500]
                        ),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: TextFormField(
                          controller: emailControllor,
                          validator: (value){
                            if(value!.isEmpty){
                              return "*required";
                            }
                          },
                          cursorColor: Colors.grey[500],
                          decoration: InputDecoration(
                              hintText: "enter your email",
                              hintStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: KPrimaryColor,width: 2),

                              ),
                              suffixIcon: Icon(Icons.email,color: KPrimaryColor,),
                              label: Text("Email",style: TextStyle(color: KPrimaryColor),)
                          )

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: TextFormField(
                          controller: passwordControllor,
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty){
                              return "*required";
                            }
                          },
                          cursorColor: Colors.grey[500],
                          decoration: InputDecoration(
                              hintText: "enter your password",
                              hintStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: KPrimaryColor,width: 2),

                              ),
                              suffixIcon: Icon(Icons.password,color: KPrimaryColor,),
                              label: Text("Password",style: TextStyle(color: KPrimaryColor),)
                          )

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: TextFormField(
                          controller: confirmPasswordControllor,

                          validator: (value){
                            if(value!.isEmpty){
                              return "*required";
                            }else if(value!=passwordControllor.text.trim()){
                              return "not match password";
                            }
                          },
                          cursorColor: Colors.grey[500],
                          decoration: InputDecoration(
                              hintText: "repeet password",
                              hintStyle: TextStyle(
                                  color: Colors.grey
                              ),
                              border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: KPrimaryColor,width: 2),

                              ),
                              suffixIcon: Icon(Icons.password,color: KPrimaryColor,),
                              label: Text("Confirm Password",style: TextStyle(color: KPrimaryColor),)
                          )

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, left: 140),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? ", style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),),
                          GestureDetector(
                            onTap: (){
                              Get.to(LogInPage());
                            },
                            child: Text("Login", style: TextStyle(
                              fontSize: 12,
                              color: KPrimaryColor,
                            ),),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(

                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.only(top :20, left: 110 , right: 110 , bottom: 20)),
                            backgroundColor: MaterialStateProperty.all(KPrimaryColor) ,
                            shape: MaterialStateProperty.all(

                                RoundedRectangleBorder(
                                    borderRadius:BorderRadius.all(Radius.circular(30))
                                )
                            ) ),
                        onPressed: () async {

                          if (_globalKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});

                            try {
                              await Signup();
                              Get.to(LogInPage());

                              showSnackBar(context, 'sign up success');

                            }on FirebaseAuthException catch (ex) {
                              if (ex.code == 'weak-password') {
                                showSnackBar(context, 'weak password');
                              } else if (ex.code == 'email-already-in-use') {
                                showSnackBar(context, 'email already exists');
                              }
                            } catch (ex) {
                              showSnackBar(context, 'there was an error');
                            }

                            isLoading = false;
                            setState(() {});

                          }
                        },
                        child: Text(
                          "SIGNUP",
                          style: TextStyle(color: Colors.white),
                        )
                    )
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}
