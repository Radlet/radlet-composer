import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  // TODO: Do we need this?
  // final FirebaseUser currentUser = await _auth.currentUser();
  // assert(user.uid == currentUser.uid);

  prefs.setBool('isSignedIn', true);

  return user;
}

Future<FirebaseUser> isSignedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final FirebaseUser currentUser = await _auth.currentUser();

  if (prefs.getBool('isSignedIn') != null &&
      prefs.getBool('isSignedIn') != false &&
      currentUser != null) {
    return currentUser;
  } else {
    return null;
  }
}

void signOutGoogle() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await googleSignIn.signOut();
  prefs.setBool('isSignedIn', false);

  print("User Sign Out");
}
