import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: _buildWidget());
  }

  Widget _buildWidget() {
    UserModel? user = _currentUser;
    if (user != null) {
      return Padding(
        padding: EdgeInsets.all(12),
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
            ElevatedButton(onPressed: signoOut, child: Text("Out"))
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            CustomWidgets.socialButtonRect('Login with Facebook', facebookColor,
                FontAwesomeIcons.facebookF,
                onTap: signIn),
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
