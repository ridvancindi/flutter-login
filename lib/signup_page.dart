// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/bg-shape.dart';
import 'package:flutter_login/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool loggedIn = false;
  String? choice;
  final Color facebookColor = const Color(0xff39579A);
  final Color googleColor = const Color(0xffDF4A32);
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool isChecked = false;
  String? _errorEmail;
  String? _weakPass;
  bool isChecked1 = false;
  int? acolor;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
            // ignore: unnecessary_const
            gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xffF29393), Color(0xffFF0000)],
        )),
        child: InkWell(
            onTap: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const LoginPage();
                })),
            child: const Center(
                child: Text(
              "Login",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ))),
      ),
    );
  }

  Widget _buildWidget() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _formKey,
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
                      height: 600,
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
                                child: TextFormField(
                                  controller: _name,
                                  
                                  
                                  keyboardType: TextInputType.name,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Burası Boş Olamaz";
                                    }
                                  },
                                  // ignore: unnecessary_const
                                  style: const TextStyle(fontSize: 14),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      labelText: 'Name',
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        size: 22,
                                        color: Color(0xffFFC400),
                                      )),
                                  autofocus: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 5, top: 10),
                                child: TextFormField(
                                  controller: _surname,
                                  keyboardType: TextInputType.name,
                                  // ignore: unnecessary_const
                                  style: const TextStyle(fontSize: 14),
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      labelText: 'Surname',
                                      prefixIcon: Icon(
                                        Icons.person_outline,
                                        size: 22,
                                        color: Color(0xffFFC400),
                                      )),
                                  autofocus: false,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 5, top: 10),
                                child: TextFormField(
                                  controller: _email,
                                  keyboardType: TextInputType.emailAddress,
                                  // ignore: unnecessary_const
                                  style: const TextStyle(fontSize: 14),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      labelText: 'Email',
                                      errorText: _errorEmail,
                                      prefixIcon: Icon(
                                        Icons.local_post_office_outlined,
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
                                child: TextFormField(
                                  controller: _password,
                                  keyboardType: TextInputType.visiblePassword,
                                  style: const TextStyle(fontSize: 14),
                                  obscureText: _isObscure,
                                  // ignore: unnecessary_const
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      labelText: 'Password',
                                      errorText: _weakPass,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isObscure
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        },
                                      ),
                                      prefixIcon: Icon(
                                        Icons.lock_outline,
                                        size: 20,
                                        color: Color(0xffFFC400),
                                      )),
                                  autofocus: false,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 15),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Gender (Optinal) :",
                                    style: TextStyle(color: Colors.black45),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 0, top: 5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: ChoiceChip(
                                              label: Text('Man',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: acolor == 1
                                                          ? Colors.red
                                                          : Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              labelPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 50),
                                              selected: choice == 'Man',
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  choice =
                                                      selected ? 'Man' : null;
                                                  acolor = selected ? 1 : null;
                                                });
                                              },
                                              backgroundColor: Colors.white,
                                              selectedColor: Colors.white,
                                              shape: ContinuousRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: choice == "Man"
                                                          ? Colors.red
                                                          : Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0)))),
                                      Expanded(
                                          child: ChoiceChip(
                                              label: Text('Woman',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: acolor == 0
                                                          ? Colors.red
                                                          : Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              labelPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 45),
                                              selected: choice == 'Woman',
                                              onSelected: (bool selected) {
                                                setState(() {
                                                  choice =
                                                      selected ? 'Woman' : null;
                                                  acolor = selected ? 0 : null;
                                                });
                                              },
                                              backgroundColor: Colors.white,
                                              selectedColor: Colors.white,
                                              shape: ContinuousRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1,
                                                      color: choice == "Woman"
                                                          ? Colors.red
                                                          : Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0))))
                                    ]),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          value: isChecked,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                        Container(
                                          child: Expanded(
                                              child: RichText(
                                            text: TextSpan(
                                              text: 'I have read the ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12),
                                              children: const <TextSpan>[
                                                TextSpan(
                                                    text:
                                                        'Membership Agreement,',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                TextSpan(text: ' I approve.'),
                                              ],
                                            ),
                                          )),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          value: isChecked1,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked1 = value!;
                                            });
                                          },
                                        ),
                                        Container(
                                          child: Expanded(
                                              child: Text(
                                            "I want to be informed about the campaigns via SMS.",
                                            style: TextStyle(fontSize: 12),
                                          )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20.0,
                                        right: 20.0,
                                        top: 0,
                                        bottom: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        _signUp();
                                      },
                                      child: Container(
                                        // ignore: prefer_const_constructors
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8.0)),
                                            // ignore: prefer_const_constructors
                                            gradient: LinearGradient(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                colors: [
                                                  const Color(0xffF29393),
                                                  const Color(0xffFF0000),
                                                ])),
                                        child: const Padding(
                                          padding: EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 8,
                                              bottom: 8),
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    )),
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
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _errorEmail =null;
      _weakPass = null;
    });
    try {
      if (_formKey.currentState!.validate()) {
        var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email.text, password: _password.text);
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.user!.uid)
            .set({
          'uid': user.user!.uid,
          'name': _name.text,
          'surname': _surname.text,
          'gender': choice,
          'agreement1': isChecked,
          'agreement2': isChecked1,
          'auth': 'user'
        });

        print(user.user!.email.toString());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        setState(() {
          _weakPass = "Weak Password.";
        });
        
        print('No user found for that email.');
      } else if (e.code == 'email-already-in-use') {
        setState(() {
          _errorEmail = "This email has been used before.";
                            
        });
      } else {
        print(e.code);
      }
    }
  }
}
