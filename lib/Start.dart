import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'Login.dart';
import 'SignUp.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  navigateToLogin()async{

    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
  }

  navigateToRegister()async{

    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        child: Column(
          children: <Widget>[

            SizedBox(height: 35.0),

            Container(
              height: 400,

              child: Image(image: AssetImage("images/welcome.jpg"),
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height : 20),

            RichText(

                text: TextSpan(
                    text: 'Welcome to ', style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                ),

                    children: <TextSpan>[
                      TextSpan(
                          text: 'Newsfeed App', style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color:Colors.orange)
                      )
                    ]
                )
            ),
            SizedBox(height: 10.0),

            Text('Get news update more faster',style: TextStyle(color:Colors.black),),

            SizedBox(height: 30.0),


            Row( mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                RaisedButton(
                    padding: EdgeInsets.only(left:30,right:30),

                    onPressed: navigateToLogin,
                    child: Text('LOGIN',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange
                ),

                SizedBox(width:20.0),

                RaisedButton(
                    padding: EdgeInsets.only(left:30,right:30),

                    onPressed: navigateToRegister,
                    child: Text('SIGNUP',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.orange
                ),

              ],
            ),


            SizedBox(height : 20.0),

            SignInButton(
              Buttons.Google,
              text: "Sign up with Google",
              onPressed: () {},
            )
          ],
        ),
      ),

    );
  }
}