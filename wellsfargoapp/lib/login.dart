import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/signup.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController(); //controllers
  final passwordController = TextEditingController();


  @override

  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/wfbg.png"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            children:  [
              SizedBox(height: 15,),
              Container(
                  margin: const EdgeInsets.only(left:20,right:20),
                  width: w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      SizedBox(height: 35,),
                      Text(
                        "WELLS FARGO",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 70,),
                      Text(
                        "Good Morning",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 80,),
                      Text(
                        "Sign in to your account",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20,),
/////////////////////////////////////////////////////////////////////////////////////
                      Container(
                        child: Card(
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                                children : <Widget>[
                                  Container(
                                    child: TextFormField(
                                      controller: emailController, //email controller
                                      decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          hintText: "Email-id",
                                          prefixIcon: Icon(Icons.email,color:Color(0xffCD1409)),
                                        )
                                      ),
                                    ),
                                  SizedBox(height: 20,),
                                  Container(
                                    child: TextFormField(
                                        controller: passwordController, //email controller
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          hintText: "Password",
                                          prefixIcon: Icon(Icons.password_sharp,color:Color(0xffCD1409)),
                                        )
                                    ),
                                  ),
                                  SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(child: Container(),),
                                      Text(
                                        "Forgot e-mail or password?",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 25.0,),
                                  GestureDetector(
                                    onTap:() => context.read<AuthenticationService>().signIn(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                    child: Container(
                                      width: w*0.3,
                                      height: h*0.06,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "img/loginbtn.png") ,
                                              fit: BoxFit.cover
                                          )
                                      ),
                                      child:
                                      Center(
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                            ),
                          ),
                        ),
                      ),
////////////////////////////////////////////////////////////////////////
                    ],
                  )
              ),
              SizedBox(height: 20,),
              SizedBox(height:w*0.1),
              RichText(text: TextSpan(
                  text: "Dont have an account?",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>const SignUp()),
                      text: " Create",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),


                    )
                  ]
              ))
            ],
          ),
        )
    );
  }

// Future signIn() async{
// await FirebaseAuth.instance.signInWithEmailAndPassword(
//   email: emailController.text.trim(),
//   password: passwordController.text.trim(),
//   );
}


