import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalpay/utils/app_shared_preferences.dart';

import 'dashboard_screen.dart';
import 'login_screen.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), _handleTapEvent);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage('images/loading.png'),
          fit: BoxFit.cover
        )
      ),
    );
  }

  void _handleTapEvent() async {
    bool isLoggedIn = await AppSharedPreferences.isUserLoggedIn();
    if (this.mounted) {
      setState(() {
        if (isLoggedIn != null && isLoggedIn) {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            new MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        }
      });
    }
  }
}
