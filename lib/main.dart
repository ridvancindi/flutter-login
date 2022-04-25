// ignore_for_file: unnecessary_const

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login/bg-shape.dart';
import 'package:flutter_login/login_page.dart';
import 'package:flutter_login/leading_page.dart';
import 'package:flutter_login/widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: const LeadingPage(),
    );
  }
}



class UserModel {
  final String? email;
  final String? id;
  final String? name;
  final PictureModel? pictureModel;
  const UserModel({this.email, this.id, this.name, this.pictureModel});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'],
        id: json['id'] as String?,
        name: json['name'],
        pictureModel: PictureModel.fromJson(json['picture']['data']));
  }
}

class PictureModel {
  final String? url;
  final int? width;
  final int? height;
  const PictureModel({this.width, this.height, this.url});
  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
      url: json['url'],
      width: json['width'],
      height: json['height'],
    );
  }
}
