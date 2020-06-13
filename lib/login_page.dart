import 'package:contactapp/home_page.dart';
import 'package:flutter/cupertino.dart';
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: 120,
            ),
            SizedBox(
              height: 30,
            ),
            Center(child: Text('Login Page')),
            SizedBox(height: 25),
            Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    : FlatButton(
                        color: Colors.blue,
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          bool isAuth = await signInWithGoogle();
                          setState(() {
                            _isLoading = false;
                          });
                          if (isAuth) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                          }
                        },
                        child: Text(
                          'Continue with Google',
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.white),
                        )))
          ],
        ),
      ),
    );
  }
}
