import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';



//Firebase Instances
final authInst = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
// final storageInst = Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);

//Firestore Collections
// final usersCollection = Provider<CollectionReference>((ref) => ref.watch(firestoreInst).collection("UserData"));
final userIdProvider = StateProvider<String?>((ref) => null);