import 'package:flutter/material.dart';
import 'package:interactive_chart/services/auth.dart';
import 'package:interactive_chart/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interactive_chart/screens/home/collection_list.dart';
import 'package:interactive_chart/models/collection.dart';
class  Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Collection>?>.value(
      value: DatabaseService(uid:'').collectionItems, initialData: null,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text("alberts appaa"),
          backgroundColor: Colors.purpleAccent[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();

              },
            )
          ],
        ),
          body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.png'),
                      fit: BoxFit.cover,
                )
              ),
              child: CollectionList())
      ),
    );
  }
}
