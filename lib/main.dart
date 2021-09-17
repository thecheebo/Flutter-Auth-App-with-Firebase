import 'package:flutter/material.dart';
import 'package:interactive_chart/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:interactive_chart/models/user.dart';
import 'package:interactive_chart/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Usercc?>.value(  //CUser is name of our custom class
      catchError: (User, Usercc) => null, // test
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        title: 'Alberts trial app',
        home: Wrapper(),
      ),
    );
  }



}
