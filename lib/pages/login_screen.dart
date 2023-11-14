import 'package:flutter/material.dart';
import 'package:flutter_dart_fun_challange/utility/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            buildDesign(),
          ],
        ),
      ),
    );
  }

  // Top Bubble Image design
  Widget buildDesign() {
    return Container(
      color: Colors.red,
      height: h! * 0.14,
      child: SvgPicture.asset(
        twitterIc,
        fit: BoxFit.cover,
      ),
    );
  }
}
