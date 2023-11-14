import 'package:flutter/material.dart';
import 'package:flutter_dart_fun_challange/utility/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isFocused = false;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            children: [
              buildDesign(),
              buildLoginText(),
              buildFields(context),
            ],
          ),
        ),
      ),
    );
  }

  // Top Bubble Image design
  Widget buildDesign() {
    return Container(
      color: Colors.red,
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
      margin: EdgeInsets.only(left: 20, right: 20),
      color: Colors.amber,
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
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            labelText: 'email',
          ),
        )
        // ),
      ],
    );
  }
}
