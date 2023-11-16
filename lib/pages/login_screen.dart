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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var _enteredEmail = '';
  var _enteredPassword = '';
  bool passwordVisible = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

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
              buildFields(_formKey, context),
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
      height: w! * 0.3,
      margin: const EdgeInsets.only(left: 20, right: 20),
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
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
              fontWeight: FontWeight.w500,
              color: HexColor('#656371'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFields(GlobalKey<FormState> formKey, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      // color: Colors.pink,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.mail_outline,
                      color: Colors.black,
                      size: 26,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            // color: Colors.amber,
                            padding: const EdgeInsets.only(left: 16),
                            height: 60,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 1, left: 8, bottom: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(
                                    left: 11, right: 3, top: 14, bottom: 2),
                                errorStyle:
                                    TextStyle(fontSize: 12, height: 0.3),
                                hintText: 'Email',
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              autocorrect: false,
                              textCapitalization: TextCapitalization.none,
                              validator: (value) =>
                                  isValidEmail(value.toString())
                                      ? null
                                      : 'Please enter valid email',
                              onSaved: (value) {
                                _enteredEmail = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Card(
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      color: Colors.black,
                      size: 26,
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            // color: Colors.amber,
                            padding: const EdgeInsets.only(left: 16),
                            height: 60,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, bottom: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    left: 11, right: 3, top: 14, bottom: 2),
                                errorStyle:
                                    TextStyle(fontSize: 12, height: 0.8),
                                hintText: 'Password',
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              obscureText: passwordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null || value.trim().length < 6) {
                                  return 'Password must be at least 6 characters long.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _enteredPassword = value!;
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
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
                    onPressed: _submit,
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
    return Expanded(
      child: Container(
        // color: Colors.green,
        margin: const EdgeInsets.only(left: 20, right: 20),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Or login with',
              style: GoogleFonts.roboto(
                color: HexColor('#AAA8B5'),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    googleIc,
                    fit: BoxFit.cover,
                    height: 64,
                    width: 64,
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    facebookIc,
                    fit: BoxFit.cover,
                    height: 64,
                    width: 64,
                  ),
                  SizedBox(width: 8),
                  Image.asset(
                    twitterIc,
                    fit: BoxFit.cover,
                    height: 64,
                    width: 64,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                // color: Colors.red,
                margin: const EdgeInsets.only(top: 38),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: "Don't have and account? ",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextSpan(
                    text: "Sign up",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: HexColor('#3885FF'),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
