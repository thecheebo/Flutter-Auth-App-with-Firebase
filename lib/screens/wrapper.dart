import 'package:flutter/material.dart';
import 'package:interactive_chart/screens/home/home.dart';
import 'package:interactive_chart/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:interactive_chart/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Usercc?>(context);

    //return home or authenticate depending if user is null
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }

  }
}
