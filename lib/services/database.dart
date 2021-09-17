import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interactive_chart/models/collection.dart';
class DatabaseService {

  final String uid;
  DatabaseService({required this.uid});

  //collection reference
  final CollectionReference collectibles = FirebaseFirestore.instance.collection('things i collect');

  Future updateUserData(String dessert, String appetizer, String savory) async {
    return await collectibles.doc(uid).set({
      'dessert': dessert,
      'appetizer': appetizer,
      'savory': savory,
    });
  }
  //collection list from snapshot
  List<Collection> _collectionListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Collection(
          dessert: doc.get('dessert') ?? '',
          appetizer: doc.get('appetizer') ?? '',
          savory: doc.get('savory') ?? ''
      );
    }).toList();
  }


  // get food query snapshot
  Stream<List<Collection>> get collectionItems {
    return collectibles.snapshots()
    .map(_collectionListFromSnapshot);
  }
}