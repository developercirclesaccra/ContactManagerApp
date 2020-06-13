import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contactapp/login_page.dart';
import 'package:contactapp/new_contact_page.dart';
import 'package:flutter/material.dart';

import 'functions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _userID;
  @override
  void initState() {
    checkAuthState();

    super.initState();
  }

  checkAuthState() async {
    bool isUserAuth = await isAuth();
    if (!isUserAuth) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
    }
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Manager',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return NewContactPage();
              }));
            },
          ),
          FlatButton(
            child: Text('Logout',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.white)),
            onPressed: () async {
              await signOut().then((_) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
              });
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: userDatabase
              .where('uploader_uid', isEqualTo: _userID)
              .getDocuments()
              .asStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text(
                  'No Contact Added!',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              );
            }

            return ListView.separated(
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 25,
                            backgroundImage: NetworkImage(
                                '${snapshot.data.documents[index].data['picUrl']}'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${snapshot.data.documents[index].data['first_name']} ${snapshot.data.documents[index].data['last_name']}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          IconButton(icon: Icon(Icons.call), onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.video_call), onPressed: () {}),
                          IconButton(
                              icon: Icon(Icons.message), onPressed: () {}),
                        ],
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: snapshot.data.documents.length);
          }),
    );
  }

  Future<void> getUserId() async {
    String userID = await getCurrentUser();
    setState(() {
      _userID = userID;
    });
  }
}
