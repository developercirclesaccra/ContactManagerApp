import 'package:contactapp/home_page.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Center(child: Text('login')),
          Center(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : FlatButton(
                      onPressed: () async {
                        setState(() {
                          _isLoading = true;
                        });
                        bool isAuth = await signInWithGoogle();
                        setState(() {
                          _isLoading = false;
                        });
                        if (isAuth) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return HomePage();
                          }));
                        }
                      },
                      child: Text('Continue with Google')))
        ],
      ),
    );
  }
}
