import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            SvgPicture.asset(
              "assets/images/login_image.svg",
              fit: BoxFit.scaleDown,
            ),
            const Text(
              "Welcome! \n Login Page",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ],
        ));
  }
}
