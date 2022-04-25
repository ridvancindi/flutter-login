import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/home_page.dart';
import 'package:flutter_login/login_page.dart';

class LeadingPage extends StatefulWidget {
  const LeadingPage({Key? key}) : super(key: key);

  @override
  State<LeadingPage> createState() => _LeadingPageState();
}

class _LeadingPageState extends State<LeadingPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var _user;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
      
      if (_user == null) {
        return LoginPage();
      } else {
        return HomePage();
      }
    
    return Container();
  }

}
