import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static final CollectionReference featured =
      FirebaseFirestore.instance.collection('featured');
}
