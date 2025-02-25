import 'package:firebase_auth/firebase_auth.dart';
import 'package:proudection/models/user_model.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel? getCurrentUser() {
    final user = _firebaseAuth.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user) : null ;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
