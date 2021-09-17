import 'package:flutter/material.dart';
import 'package:interactive_chart/models/collection.dart';

class CollectionTile extends StatelessWidget {

  final Collection? collection;
  CollectionTile({ this.collection});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundImage:
                AssetImage("assets/mtg.png"),
                backgroundColor: Colors.brown[100],
              ),
                  title: Text('Magic the Gathering'),
                  subtitle: Text('Magic: The Gathering is a collectible card game created in 1993 by Wizards of the Coast')
            )
      )
    );
  }
}
