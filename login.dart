import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Page",
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.green,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/flut.png"),
            fit: BoxFit.cover,
            color: Colors.black,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
                
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.light,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0
                      )
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: "Enter Email ID"
                          ),
//                          keyboardType: TextInputType.emailAddress,
                        ),
                        Padding(padding: EdgeInsets.only(top : 20.0)),
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: "Enter Password"
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),

//                        Padding(padding: EdgeInsets.only(top : 20.0)),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 120.0,
                          color: Colors.teal,
                          onPressed: ()=>{},
                          textColor: Colors.white,
                            splashColor: Colors.greenAccent,
                          child: Icon(Icons.lock_open),

                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          )
        ],
      )

      );
  }
}

