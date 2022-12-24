import 'package:e_commerce_flutter/show_snank_bar.dart';
import 'package:e_commerce_flutter/sign_up_page.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'consetants.dart';

class LogInPage extends StatefulWidget {
  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isLoading = false;
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  final emailControllor= TextEditingController();
  final passwordControllor= TextEditingController();


  void initState() {
    super.initState();
  }
  void dispose(){
    emailControllor.dispose();
    passwordControllor.dispose();
    super.dispose();
  }
  Future <void> Login()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailControllor.text.trim(), password: passwordControllor.text.trim());
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
                        child: Text("LOGIN", style: TextStyle(
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
                        children: const [
                          Text("Welcome Back", style: TextStyle(
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
                        Text("login with your Email and password\n       or continue with social media" ,style: TextStyle(
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
                              hintText: "Enter your password",
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
                      padding: const EdgeInsets.only(bottom: 20, left: 140),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? ", style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),),
                          GestureDetector(
                            onTap: (){
                              Get.to(SignUpPage());
                            },
                            child: const Text("Sign Up", style: TextStyle(
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
                        onPressed: ()async {

                          if (_globalKey.currentState!.validate()) {
                            isLoading = true;
                            setState(() {});

                            try{
                              await Login();
                              Get.to(HomeScreen());

                              showSnackBar(context, 'login success');

                            }on FirebaseAuthException catch (ex) {
                              if (ex.code == 'user-not-found') {
                                showSnackBar(context, 'user not found');
                              } else if (ex.code == 'wrong-password') {
                                showSnackBar(context, 'wrong password');
                              }
                            } catch (ex) {
                              print(ex);
                              showSnackBar(context, 'there was an error');
                            }

                            isLoading = false;
                            setState(() {});
                          }
                        },
                        child: Text(
                          "LOGIN",
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
