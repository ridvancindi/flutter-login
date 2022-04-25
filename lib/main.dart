// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_login/bg-shape.dart';
import 'package:flutter_login/widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loggedIn = false;
  AccessToken? _accessToken;
  UserModel? _currentUser;
  final Color facebookColor = const Color(0xff39579A);
  final Color twitterColor = const Color(0xff00ABEA);
  final Color googleColor = const Color(0xffDF4A32);
  @override
  Widget build(BuildContext context) {
    UserModel? user = _currentUser;
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
              clipper: MyClipper(),
              child: Container(
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    // ignore: prefer_const_constructors
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        // ignore: prefer_const_literals_to_create_immutables
                        colors: [
                          const Color(0xffF29393),
                          const Color(0xffFB6E6E),
                          const Color(0xffFF0000),
                        ])),
                child: null,
              )),
          _buildWidget()
        ],
      ),
    );
  }

  Widget _buildWidget() {
    UserModel? user = _currentUser;
    if (user != null) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: user.pictureModel!.width! / 6,
                backgroundImage: NetworkImage(user.pictureModel!.url!),
              ),
              title: Text(user.name!),
              subtitle: Text(user.email!),
            ),
            ElevatedButton(onPressed: signoOut, child: const Text("Out"))
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Stack(children: [
                  Container(
                      margin: const EdgeInsets.only(top: 35),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Colors.white,
                        border:
                            Border.all(width: 2, color: Colors.grey.shade500),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(0, 4), // Shadow position
                          ),
                        ],
                      ),
                      height: 450,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 55),
                        child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 5, top: 10),
                                child: const TextField(
                                  // ignore: unnecessary_const
                                  style: TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      labelText: 'Email',
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        size: 22,
                                        color: Color(0xffFFC400),
                                      )),
                                  autofocus: false,
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10, top: 5),
                                child: const TextField(
                                  style: TextStyle(fontSize: 14),
                                  // ignore: unnecessary_const
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      labelText: 'Password',
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        size: 20,
                                        color: Color(0xffFFC400),
                                      )),
                                  autofocus: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 10,
                                    bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: const Text(
                                        "I forgot my password",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      // ignore: prefer_const_constructors
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(8.0)),
                                          // ignore: prefer_const_constructors
                                          gradient: LinearGradient(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              colors: [
                                                const Color(0xffF29393),
                                                const Color(0xffFF0000),
                                              ])),
                                      child: GestureDetector(
                                        onTap: () {
                                          print("deneme");
                                        },
                                        child: const Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 8,
                                              bottom: 8),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    const Expanded(
                                        child:
                                            Divider(height: 2, thickness: 2)),
                                    const Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: const Text("Quick Connect"),
                                    ),
                                    const Expanded(
                                        child: const Divider(
                                            height: 2, thickness: 2)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomWidgets.socialButtonRect(
                                        'Facebook',
                                        facebookColor,
                                        FontAwesomeIcons.facebookF,
                                        onTap: () {}),
                                    CustomWidgets.socialButtonRect(
                                        'Google',
                                        googleColor,
                                        FontAwesomeIcons.googlePlusG,
                                        onTap: () {
                                    }),
                                  ],
                                ),
                              ),
                            ]),
                      )),
                  Container(
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                        const BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(0, 4), // Shadow position
                        ),
                      ],
                    ),
                    child: const Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person_rounded,
                                color: Colors.black,
                                size: 35,
                              ),
                              radius: 38.0,
                              backgroundImage: null),
                        )),
                  ),
                ]),
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> signIn() async {
    final LoginResult result = await FacebookAuth.i.login();
    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      final data = await FacebookAuth.i.getUserData();
      UserModel model = UserModel.fromJson(data);
      _currentUser = model;
      setState(() {});
    }
  }

  Future<void> signoOut() async {
    await FacebookAuth.i.logOut();
    _currentUser = null;
    _accessToken = null;
    setState(() {});
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
