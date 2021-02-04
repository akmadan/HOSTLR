import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

save(String place_name, place_location) async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  final customeruid = user.uid;
  await Firestore.instance
      .collection('saved')
      .document(place_location)
      .collection(place_name)
      .document(customeruid)
      .setData({'customer_uid': customeruid});
  print('saved');
  await Firestore.instance
      .collection('users')
      .document(place_location)
      .collection('data')
      .document(customeruid)
      .collection('saved')
      .document(place_name)
      .setData({'place_name': place_name});
}

remove_save(String place_name, place_location) async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  final customeruid = user.uid;
  await Firestore.instance
      .collection('saved')
      .document(place_location)
      .collection(place_name)
      .document(customeruid)
      .delete();
  print('removed');
  await Firestore.instance
      .collection('users')
      .document(place_location)
      .collection('data')
      .document(customeruid)
      .collection('saved')
      .document(place_name)
      .delete();
}

deleteplace(String area, String uid, String name) async {
  await Firestore.instance
      .collection('places')
      .document(area)
      .collection('data')
      .document(name)
      .delete();

  await Firestore.instance
      .collection('users')
      .document(area)
      .collection('data')
      .document(uid)
      .collection('places')
      .document(name)
      .delete();
}
