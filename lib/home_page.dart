import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged"),
        actions: [IconButton(onPressed: _out, icon: Icon(Icons.exit_to_app))],
      ),
    );
  }

  void _out() {
    FirebaseAuth.instance.signOut();
  }
}
