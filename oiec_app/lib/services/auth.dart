import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:oiec_app/globals.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 1;
      } else if (e.code == 'email-already-in-use') {
        return 2;
      }
      // ignore: empty_catches
    } catch (e) {}
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final a = userCredential.user;
      if (a?.uid != null) {
        return a?.uid;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 1;
      } else if (e.code == 'wrong-password') {
        return 2;
      }
    }
  }

  void agregarUsuario(String nombreCompleto, String cedula, String fechaN,
      String curso, String correo) async {
    
    var infoUser = _auth.currentUser;
    CollectionReference user = FirebaseFirestore.instance.collection('User');

    user.doc(infoUser!.uid).set({
      'nombreCompleto': nombreCompleto,
      'cedula': cedula,
      'fechaNacimiento': fechaN,
      'curso': curso,
      'correo': correo,
      'role': "student"
    });
  }

  void definirRol() async {
    var infoUser = _auth.currentUser;
    var kk = FirebaseFirestore.instance
    .collection('User')
    .doc(infoUser!.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot){
      if(documentSnapshot.exists){
        if(documentSnapshot.get('role')=="trainer"){
          isTrainer = true;
        }else{
          isTrainer = false;
        }
      }
    });
  }

  void obtenerCedula() async {
    var infoUser = _auth.currentUser;
    var kk = FirebaseFirestore.instance
    .collection('User')
    .doc(infoUser!.uid)
    .get()
    .then((DocumentSnapshot documentSnapshot){
      if(documentSnapshot.exists){
        cedula = documentSnapshot.get('cedula');
      }
    });
  }
}
