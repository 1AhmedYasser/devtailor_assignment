import 'package:flutter/material.dart';
import './Constants/resources.dart';
import './Screens/Authentication/signup_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DevTailorAssignment());
}

class DevTailorAssignment extends StatelessWidget {
  const DevTailorAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: R.constants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: R.colors.primaryColor,
        fontFamily: R.constants.notoSansFont,
      ),
      home: const SignupScreen(),
    );
  }
}
