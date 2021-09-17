import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:interactive_chart/models/collection.dart';
import 'package:interactive_chart/screens/home/collection_tile.dart';

class CollectionList extends StatefulWidget {
  const CollectionList({Key? key}) : super(key: key);

  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionList> {
  @override
  Widget build(BuildContext context) {
    final collectionItems = Provider.of<List<Collection>?>(context);


    return ListView.builder(
        itemCount: collectionItems!.length,
        itemBuilder: (context, index) {
          return CollectionTile(collection: collectionItems[index]);

        },
    );

  }
}
