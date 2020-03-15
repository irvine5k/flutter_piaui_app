import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthController with _$AuthController;

abstract class _AuthController with Store {
  final _firebaseInstance = FirebaseAuth.instance;

  @computed
  ObservableStream<FirebaseUser> get authStream =>
      _firebaseInstance.onAuthStateChanged.asObservable();

  @observable
  String error = '';

  @observable
  bool loading = false;

  @action
  Future<void> getCurrentUser() async {
    try {
      loading = true;

      await _firebaseInstance.currentUser();

      loading = false;
    } catch (e) {
      loading = false;

      error = 'Não conseguimos entrar, por favor, tente novamente';
    }
  }

  @action
  Future<void> signIn() async {
    try {
      loading = true;

      final googleSignIn = GoogleSignIn();
      final googleAccount = await googleSignIn.signIn();

      if (googleAccount != null) {
        final googleAuth = await googleAccount.authentication;

        await _firebaseInstance.signInWithCredential(
          GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
      }

      loading = false;
    } catch (e) {
      loading = false;

      error = 'Não foi possível entrar, tente novamente.';

      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      loading = true;

      final googleSignIn = GoogleSignIn();
      googleSignIn.signOut();
      await _firebaseInstance.signOut();

      loading = false;
    } catch (e) {
      loading = false;

      error = 'Não foi possível sair, tente novamente.';

      throw e;
    }
  }
}
