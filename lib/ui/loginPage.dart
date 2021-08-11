import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'code.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class PhoneAuth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneAuthState();
  }
}

class PhoneAuthState extends State<PhoneAuth> {
  var send = Firebase.initializeApp();
  var o = Firebase.initializeApp();
  String? username;
  String? phone;
  var _formKey = GlobalKey<FormState>();
  String? verificationId;

  @override
  void initState() {
    super.initState();
    _authUser.authStateChanges().listen((event) {
      if (event == null) {
        print("User signed out ");
      } else {
        print("User signed up");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/tree5.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 150.0, top: 100.0),
                child: Text(
                  "Create \nAccount",
                  style: TextStyle(
                      fontSize: 45.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(height: 100.0),
                      TextFormField(
                        validator: (text) {
                          if (text!.length < 4) {
                            return "Must be at lesat 4 sign";
                          }
                        },
                        onSaved: (text) {
                          username = text;
                        },
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 17.0,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      TextFormField(
                        onSaved: (text) {
                          phone = text;
                        },
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        initialValue: "+998",
                        maxLength: 13,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          labelStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 17.0,
                          ),
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 17.0,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 100.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await _authUser.verifyPhoneNumber(
                            phoneNumber: phone!,
                            verificationCompleted: (phoneAuthCredential) {},
                            verificationFailed: (firebaseAuthException) {},
                            codeSent: (verificationId, resendToken) async {
                              setState(() {
                                this.verificationId = verificationId;
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VerifySms(verificationId),
                                ),
                              );
                            },
                            codeAutoRetrievalTimeout: (verificationId) {},
                          );
                        }
                      },
                      child: Icon(Icons.arrow_forward),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade800,
                        fixedSize: Size(100.0, 50.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}