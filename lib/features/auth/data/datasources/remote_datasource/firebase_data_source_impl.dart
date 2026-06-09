import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../core/constants/constant.dart';
import '../../../../../core/params/params.dart';
import '../../../../../global.dart';
import 'auth_remote_data_source.dart';

class FirebaseDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignIn;

  FirebaseDataSourceImpl(this.auth, this.googleSignIn, this.firestore);

  @override
  Future<bool> isSignedIn() async {
    if (auth.currentUser != null) {
      Global.storageService.setBool(AppConstants.isLoggedIn, true);
    }
    return auth.currentUser != null;
  }

  @override
  Future<void> googleAuth() async {}

  @override
  Future<void> logOut() async {
    await auth.signOut();
    Global.storageService.setBool(AppConstants.isLoggedIn, false);
  }

  @override
  Future<void> signInWithEmail(AuthParams params) async {
    await auth.signInWithEmailAndPassword(email: params.email, password: params.password);
  }

  @override
  Future<void> signUpWithEmail(AuthParams params) async {
    await auth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}
