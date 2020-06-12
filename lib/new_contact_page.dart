import 'dart:io';

import 'package:contactapp/functions.dart';
import 'package:contactapp/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File _image;
  bool _isLoading = false;
  final _firstNameEditTextController = TextEditingController();
  final _lastNameEditTextController = TextEditingController();
  final _phoneNumberEditTextController = TextEditingController();
  final _addressEditTextController = TextEditingController();
  final firstNameNode = FocusNode();
  final lastNameNode = FocusNode();
  final phoneNumberNode = FocusNode();
  final addressNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(
        'Fields cannot be Empty!',
        style: Theme.of(context).textTheme.caption.copyWith(color: Colors.red),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'New Contact',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 120,
            child: Stack(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    backgroundImage: _image == null
                        ? ExactAssetImage('assets/avatar.png')
                        : FileImage(_image),
                  ),
                ),
                Positioned(
                  top: 70,
                  right: 110,
                  child: FloatingActionButton(
                    elevation: 1,
                    mini: true,
                    onPressed: () async {
                      File image = await imageSelector();
                      setState(() {
                        _image = image;
                      });
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameEditTextController,
                  style: Theme.of(context).textTheme.bodyText1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  
                  enabled: !_isLoading,
                  enableInteractiveSelection: true,
                  focusNode: firstNameNode,
                  decoration: InputDecoration(
                      labelText: 'First Name',
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder,
                      focusedErrorBorder: Theme.of(context)
                          .inputDecorationTheme
                          .focusedErrorBorder,
                      disabledBorder:
                          Theme.of(context).inputDecorationTheme.disabledBorder,
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      filled: true,
                      labelStyle:
                          Theme.of(context).inputDecorationTheme.labelStyle,
                      errorStyle:
                          Theme.of(context).inputDecorationTheme.errorStyle),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(lastNameNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'First Name cannot be null';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _lastNameEditTextController,
                  style: Theme.of(context).textTheme.bodyText1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.text,
                  
                  enabled: !_isLoading,
                  enableInteractiveSelection: true,
                  focusNode: lastNameNode,
                  decoration: InputDecoration(
                      labelText: 'Last Name',
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder,
                      focusedErrorBorder: Theme.of(context)
                          .inputDecorationTheme
                          .focusedErrorBorder,
                      disabledBorder:
                          Theme.of(context).inputDecorationTheme.disabledBorder,
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      filled: true,
                      labelStyle:
                          Theme.of(context).inputDecorationTheme.labelStyle,
                      errorStyle:
                          Theme.of(context).inputDecorationTheme.errorStyle),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(phoneNumberNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Last Name cannot be null';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneNumberEditTextController,
                  style: Theme.of(context).textTheme.bodyText1,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  
                  enabled: !_isLoading,
                  enableInteractiveSelection: true,
                  focusNode: phoneNumberNode,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder,
                      focusedErrorBorder: Theme.of(context)
                          .inputDecorationTheme
                          .focusedErrorBorder,
                      disabledBorder:
                          Theme.of(context).inputDecorationTheme.disabledBorder,
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      filled: true,
                      labelStyle:
                          Theme.of(context).inputDecorationTheme.labelStyle,
                      errorStyle:
                          Theme.of(context).inputDecorationTheme.errorStyle),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(addressNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Phone Number cannot be null';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _addressEditTextController,
                  style: Theme.of(context).textTheme.bodyText1,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.text,
                  
                  enabled: !_isLoading,
                  enableInteractiveSelection: true,
                  focusNode: addressNode,
                  decoration: InputDecoration(
                      labelText: 'Address',
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      focusedBorder:
                          Theme.of(context).inputDecorationTheme.focusedBorder,
                      enabledBorder:
                          Theme.of(context).inputDecorationTheme.enabledBorder,
                      errorBorder:
                          Theme.of(context).inputDecorationTheme.errorBorder,
                      focusedErrorBorder: Theme.of(context)
                          .inputDecorationTheme
                          .focusedErrorBorder,
                      disabledBorder:
                          Theme.of(context).inputDecorationTheme.disabledBorder,
                      fillColor:
                          Theme.of(context).inputDecorationTheme.fillColor,
                      filled: true,
                      labelStyle:
                          Theme.of(context).inputDecorationTheme.labelStyle,
                      errorStyle:
                          Theme.of(context).inputDecorationTheme.errorStyle),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Address cannot be null';
                    }
                    return null;
                  },
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          FlatButton(
            onPressed: () async {
              if (!_formKey.currentState.validate()) {
                //error
                print('invalid');
              } else {
                //valid
                bool isSuccess = await saveNewContact(
                    firstName: _firstNameEditTextController.text,
                    lastName: _lastNameEditTextController.text,
                    phoneNumber: _phoneNumberEditTextController.text,
                    address: _addressEditTextController.text,
                    profilePic: _image);
                if (isSuccess) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
                } else {
                  print('error');
                }
              }
            },
            child: Text(
              'Save Contact',
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(color: Colors.white),
            ),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
