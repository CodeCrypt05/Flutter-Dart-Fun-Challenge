import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dart_fun_challange/utility/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              buildDesign(),
              buildLoginText(),
              buildFields(context),
              buildOrLoginWith(),
            ],
          ),
        ),
      ),
    );
  }

  // Top Bubble Image design
  Widget buildDesign() {
    return Container(
      // color: Colors.red,
      height: h! * 0.18,
      alignment: Alignment.topRight,
      child: Image.asset(
        bubbleImg,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildLoginText() {
    return Container(
      width: double.infinity,
      height: w! * 0.20,
      margin: EdgeInsets.only(left: 20, right: 20),
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login',
            style: GoogleFonts.roboto(
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          ),
          Text(
            'Please sign in to continue',
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFields(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      height: w! * 0.66,
      // color: Colors.pink,
      child: Form(
        // key: formKey,
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Card(
              elevation: 8,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: const EdgeInsets.only(top: 18),
                      child: Icon(
                        Icons.mail_outline,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.amber,
                        padding: const EdgeInsets.only(left: 16, top: 6),
                        height: 60,
                        child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Email', border: InputBorder.none)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 8,
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      // padding: const EdgeInsets.only(top: 18),
                      child: Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                        size: 26,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        // color: Colors.amber,
                        padding: const EdgeInsets.only(left: 16, top: 6),
                        height: 60,
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Password', border: InputBorder.none),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: double.infinity,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [HexColor('#0B63FF'), HexColor('#589EFF')],
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: Container(
                        width: 130,
                        height: 52,
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        alignment: Alignment.center,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'LOGIN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrLoginWith() {
    return Container(
      color: Colors.green,
      margin: EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      height: w! * 0.86,
      child: Column(
        children: [
          Text(
            'Or login with',
            style: GoogleFonts.roboto(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
