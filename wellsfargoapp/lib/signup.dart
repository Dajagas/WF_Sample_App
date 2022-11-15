import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
     
   final TextEditingController emailController   = TextEditingController(); //controllers
   final TextEditingController passwordController= TextEditingController();
  
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
 

    List images = [
      "g.png",
      "t.png",
      "f.png"
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
     return Scaffold(
       backgroundColor: Color.fromARGB(255, 224, 209, 236),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("img/wfbg.png"),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Container(
              margin: const EdgeInsets.only(left:20,right:20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  SizedBox(height: 35.0,),
                  Text(
                    "WELLS FARGO",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40.0,),
                  Text(
                    "Get Started",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 80,),
                  Container(
                    child: Card(
                      elevation:20,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children : <Widget>[
                              Container(
                                child: TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: "email id",
                                    prefixIcon: Icon(Icons.email,color:Color(0xffCD1409)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              Container(
                                child: TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(),
                                    hintText: "password",
                                    prefixIcon: Icon(Icons.password_sharp,color:Color(0xffCD1409)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20,),
                              GestureDetector(
                                onTap: () => context.read<AuthenticationService>().signUp(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                                child: Container(
                                  width: w*0.4,
                                  height: h*0.08,
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
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),

                                ),
                              ),
                              SizedBox(height: 10,),
                              RichText(text:
                              TextSpan(
                                  recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                                  text: "Have an account? Sign in",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey[600]
                                  )
                              )),
                              SizedBox(height:25),
                              RichText(text: TextSpan(
                                text: "Or signup using",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                ),

                              )),
                              Wrap(
                                children: List<Widget>.generate(
                                    3,
                                        (index){
                                      return Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor: Colors.grey[100],
                                          child: CircleAvatar(
                                            radius: 25,
                                            backgroundImage: AssetImage(
                                                "img/"+ images[index]
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                ),
                              )

                              ]
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              )
            ),
            SizedBox(height: 70,),
            SizedBox(height: 10,),

          ],
        ),
      )
    );
  }
}

