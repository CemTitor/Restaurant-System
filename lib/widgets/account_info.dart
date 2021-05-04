import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AccountInfo extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String name = 'isim';

  // Future<String> getName() async {
  //   DocumentReference documentReference =
  //       _firestore.collection('users').doc(_auth.currentUser.uid);
  //   await documentReference.get().then((DocumentSnapshot docSnapshot) {
  //     name = docSnapshot.data()['name'];
  //   });
  //   return name;
  // }

  @override
  Widget build(BuildContext context) {
    _firestore
        .collection('users')
        .doc(_auth.currentUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      // print('Document data: ${documentSnapshot.data()}');
      // print(documentSnapshot.data()['name']);
      // print(documentSnapshot.get('surname'));

      name = (documentSnapshot.data()['name']).toString();
    });

    // try {
    //   dynamic nested = snapshot.get(FieldPath(['address', 'postcode']));
    // } on StateError catch(e) {
    //   print('No nested field exists!');
    // }

    return Container(
      color: Colors.lightBlueAccent,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Image.asset(
                  "images/popcorn.png",
                  //TODO: add user photo insted of popcorn
                  height: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$name',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "0 Point",
                      style: TextStyle(color: Colors.white),
                    ),
                    //TODO: add user info from database
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'images/trophy.png',
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}
