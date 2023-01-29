import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcomePage.dart';
import 'logIn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'signup.dart';
import 'teacherdashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'studentHomePage.dart';
import 'countingSession.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final ref = FirebaseDatabase.instance.ref().child('Users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: StreamBuilder(
              stream: ref.child(countingSession().userId.toString()).onValue,
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  Map<dynamic, dynamic> map = snapshot.data.snapshot.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 3)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://www.w3schools.com/howto/img_avatar.png"),
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                        child: CircularProgressIndicator());
                                  },
                                  errorBuilder: (context, object, stack) {
                                    return Container(
                                        child: Icon(Icons.error_outline,
                                            color: Colors.red));
                                  }),
                            )),
                      ),
                      ListTile(
                        title: Text(map['name']),
                      )
                    ],
                  );
                } else {
                  return Center(
                      child: Text(
                    "Something went wrong",
                    style: GoogleFonts.poppins(fontSize: 20),
                  ));
                }
              }),
        ),
      ),
    );
  }
}
