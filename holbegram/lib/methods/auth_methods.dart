import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:holbegram/models/user.dart';
import 'package:holbegram/screens/login_screen.dart';
import 'dart:typed_data';

class AuthMethode {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // methode pour gérer le login
  Future<String> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    String res = "An error occurred";

    try {
      if (email.isEmpty || password.isEmpty) {
        return 'Please fill all the fields';
      }

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(
              emailController: TextEditingController(),
              passwordController: TextEditingController(),
            ),
          ));
      res = "Success";
    } on FirebaseAuthException catch (e) {
      // Gérer les erreurs spécifiques de FirebaseAuth
      if (e.code == 'user-not-found') {
        res = "No user found for that email.";
      } else if (e.code == 'wrong-password') {
        res = "Wrong password provided for that user.";
      }
    } catch (e) {
      // Gérer d'autres types d'erreurs
      res = e.toString();
    }

    return res;
  }

  // methode pour gérer le signup
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    Uint8List? file,
    required BuildContext context,
  }) async {
    String res = "An error occurred";

    try {
      if (email.isEmpty || password.isEmpty || username.isEmpty) {
        return 'Please fill all the fields';
      }

      // Création de l'utilisateur dans Firebase Auth
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Récupération de l'utilisateur
      User? user = userCredential.user;
      if (user == null) {
        return "User creation failed.";
      }

      // Création de l'instance de la classe Users
      Users users = Users(
        uid: user.uid,
        email: email,
        username: username,
        bio: "",
        photoUrl: file != null ? "some_photo_url" : "",
        followers: [],
        following: [],
        posts: [],
        saved: [],
        searchKey: username.substring(0, 1).toLowerCase(),
      );

      await _firestore.collection("users").doc(user.uid).set(users.toJson());

      res = "Success";
    } on FirebaseAuthException catch (e) {
      // Gestion des erreurs FirebaseAuth spécifiques
      if (e.code == 'email-already-in-use') {
        res = "Email already in use.";
      } else if (e.code == 'weak-password') {
        res = "The password is too weak.";
      } else {
        res = e.message ?? "An unknown error occurred.";
      }
    } catch (e) {
      // Gestion des autres erreurs
      res = e.toString();
    }

    return res;
  }
}
