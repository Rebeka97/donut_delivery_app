import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:donut_repository/donut_repository.dart';

class FirebaseDonutRepo implements DonutRepo {
  static const String collectionName = 'donuts';
  final donutCollection = FirebaseFirestore.instance.collection(collectionName);

  @override
  Stream<List<Donut>> getDonuts() {
    return donutCollection.snapshots().map(
      (snapshot) => snapshot.docs
          .map(
            (document) => Donut.fromEntity(
              DonutEntity.fromDocument(document.data(), document.id),
            ),
          )
          .toList(),
    );
  }
}
