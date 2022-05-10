import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  User? user;
  HomePage(this.user);

  @override
  State<HomePage> createState() => _HomePageState(user);
}

class _HomePageState extends State<HomePage> {
  User? user;
  _HomePageState(this.user);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged"),
        actions: [IconButton(onPressed: _out, icon: Icon(Icons.exit_to_app))],
      ),
      body: ElevatedButton(
          onPressed: () async{
           
          },
          child: Text(user!.uid.toString())),
    );
  }

  void _out() {
    FirebaseAuth.instance.signOut();
  }
}
