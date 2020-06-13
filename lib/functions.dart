import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final mStorage = FirebaseStorage.instance;
final userDatabase = Firestore.instance.collection('Contacts');

Future<File> imageSelector(
    {ImageSource imageSource = ImageSource.gallery}) async {
  PickedFile pickedFile = await ImagePicker().getImage(source: imageSource);
  return await ImageCropper.cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.blue,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: IOSUiSettings(
        minimumAspectRatio: 1.0,
      ));
}

//login
Future<bool> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken);
  final firebaseUser =
      (await _firebaseAuth.signInWithCredential(credential)).user;
  if (firebaseUser != null) {
    return true;
  } else {
    return false;
  }
}

Future<bool> isAuth() async {
  FirebaseUser user = await _firebaseAuth.currentUser();
  if (user != null) {
    return true;
  } else {
    return false;
  }
}

Future<String> getCurrentUser() async {
  FirebaseUser user = await _firebaseAuth.currentUser();
  return user.uid;
}

Future<String> uploadFile({File file}) async {
  final String fileName = '${Random().nextInt(1000)}.png';
  final StorageUploadTask uploadTask =
      mStorage.ref().child('user_profile').child(fileName).putFile(file);
  final StorageTaskSnapshot downloadUri = (await uploadTask.onComplete);
  final String downloadUrl = (await downloadUri.ref.getDownloadURL());
  return downloadUrl;
}

//save new contact to db
Future<bool> saveNewContact(
    {@required String firstName,
    @required String lastName,
    @required String phoneNumber,
    @required String address,
    @required File profilePic}) async {
  bool isSuccess = false;
  String currentUid = await getCurrentUser();
  String pictureUrl = await uploadFile(file: profilePic);
  if (pictureUrl != null) {
    await userDatabase.add({
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'address': address,
      'picUrl': pictureUrl,
      'uploader_uid': currentUid,
      'created_at': FieldValue.serverTimestamp()
    }).then((_) {
      isSuccess = true;
    }).catchError((onError) {
      print('$onError');
      isSuccess = false;
    });
    return isSuccess;
  } else {
    isSuccess = false;
  }
  return isSuccess;
}

signOut() async{
  await _firebaseAuth.signOut();
}