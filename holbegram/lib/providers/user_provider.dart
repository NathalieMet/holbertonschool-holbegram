import 'package:flutter/material.dart';
import 'package:holbegram/models/user.dart';
import 'package:holbegram/methods/auth_methods.dart';

class UserProvider with ChangeNotifier{
  Users? _user;
  final AuthMethode _authMethods = AuthMethode();

  Users? get user => _user;

  Future<void> refreshUser() async {
    try {
      // Fetch user details from AuthMethods
      Users userDetails = await _authMethods.getUserDetails();
      _user = userDetails;

      // Notify listeners of the change
      notifyListeners();
    } catch (e) {
      throw Exception("Error refreshing user: $e");
    }
  }
  }
