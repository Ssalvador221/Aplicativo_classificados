import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/user_repository.dart';

abstract class UserRepository {
  /* Stream */
  Stream<User?> get user;

  /* Firebase Auth  */
  Future<void> signIn(String email, String password);
  Future<void> logOut();
  Future<MyUser> signUp(MyUser myUser, String password);
  Future<void> resetPassword(String email);

  /* setUserData */
  Future<void> setUserData(MyUser user);

  /* getMyUser */
  Future<MyUser> getMyUser(String myUserId);
}
