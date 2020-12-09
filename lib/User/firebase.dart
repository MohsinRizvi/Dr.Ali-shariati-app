import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

Future<void> userSetup(String displayName, number) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  users.add({'displayName': displayName, 'number': number, 'uid': uid});
  return;
}

// Future SignOut() async {
//   try {
//     return await auth.signOut();
//   } catch (e) {
//     print(e.toString());
//     return null;
//   }
// }
