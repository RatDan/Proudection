import 'package:flutter/material.dart';
import 'package:proudection/models/user_model.dart';
import 'package:proudection/repositories/auth_repository.dart';

class AuthViewModel extends ChangeNotifier{
  final AuthRepository _authRepository;
  UserModel? _user;

  AuthViewModel(this._authRepository) {
    checkUserStatus();
  }

  UserModel? get user => _user;

  void checkUserStatus() {
    _user = _authRepository.getCurrentUser();
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}
