import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
       backgroundColor: Colors.white,
      body: Column(
        children:  [
          Container(
            width: w,
            height: h*0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "img/signup.png") ,
                  fit: BoxFit.cover
                )
            ),
            child: Column(
              children: [
                SizedBox(height:h*0.16,),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                    "img/profile.jpg"
                  ),
                )
              ],
            ),

          ),
  
          SizedBox(height: 70,),
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
              "Welcome",
              style:TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black54
              ),
            ),
            Text(
              "ExmapleUser@email",
              style:TextStyle(
                fontSize: 18,
               
                color: Colors.grey[500]
              ),
            ),
              ],
            ),
          ),
         SizedBox(height:100),
          GestureDetector(
            onTap:() => context.read<AuthenticationService>().signOut(),
            child: Container(
              width: w*0.5,
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
                      "Sign Out",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
              ),
              
            ),
          ),
      
        ]
      )
    );
    
  }
}