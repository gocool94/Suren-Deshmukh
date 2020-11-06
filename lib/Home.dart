import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newsfeed_app/Start.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isloggedin= false;


  checkAuthentification() async{

    _auth.onAuthStateChanged.listen((user) {

      if(user ==null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Start()));
      }
    });
  }

  getUser() async{

    FirebaseUser firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if(firebaseUser !=null)
    {
      setState(() {
        this.user =firebaseUser;
        this.isloggedin=true;
      });
    }
  }

  signOut()async{

    _auth.signOut();
  }

  @override
  void initState(){

    this.checkAuthentification();
    this.getUser();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
         title: new Text("Newsfeed App",
             style: TextStyle(
                 color: Colors.white
             )),
         backgroundColor: Colors.orange,
       ),
      drawer: new Drawer(
        child: Container(
          color: Colors.orange,
          child: new ListView(
            children: <Widget>[

              new UserAccountsDrawerHeader(
                  accountName: new Text ("NewsFeed app",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white
                      )),
                  accountEmail: null,
                decoration: new BoxDecoration(
                  color: Colors.orange
                ),
              ),

              new ListTile(
                title: new Text("Events",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white
                )
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
                leading: new Icon(Icons.event,color: Colors.white,size: 20.0,),
              ),
              new ListTile(
                title: new Text("Time Table",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    )
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
                leading: new Icon(Icons.schedule,color: Colors.white,size: 20.0,),
              ),
              new ListTile(
                title: new Text("Sports",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    )
                ),
                onTap: (){
                  Navigator.of(context).pop();
                },
                leading: new Icon(Icons.sports,color: Colors.white,size: 20.0,),
              ),
              new ListTile(
                title: new Text("Exams",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    )
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: new Icon(Icons.event,color: Colors.white,size: 20.0,),
              ),
              new ListTile(
                title: new Text("Signout",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white
                    ),
                  ),
                onTap: signOut,
                leading: new Icon(Icons.exit_to_app_rounded,color: Colors.white,size: 20.0,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
