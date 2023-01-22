import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gamexchange/models/user_model.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future signUp(String id, String password, String passwordConfirmation,
    String email, String name, String nick, String cpf, String phone) async {
  UserModel newUser =
      UserModel(id: id, name: name, nick: nick, cpf: cpf, phone: phone);

  bool passwordConfirmed() {
    if (password == passwordConfirmation) {
      return true;
    } else {
      return false;
    }
  }

  //Create user
  if (passwordConfirmed()) {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    //Add user details
    addUserDetails(
      newUser,
    );
  }
}

void addUserDetails(UserModel user) async {
  await _firestore.collection('users').add({
    'name': user.name,
    'nick': user.nick,
    'cpf': user.cpf,
    'phone': user.phone,
  });
}

Future<List<UserModel>> getUsers() async {
  final QuerySnapshot snapshot = await _firestore.collection('users').get();

  final List<UserModel> users = [];

  for (var doc in snapshot.docs) {
    users.add(UserModel(
      id: doc.reference.id,
      name: doc['name'],
      nick: doc['nick'],
      cpf: doc['cpf'],
      phone: doc['phone'],
    ));
  }

  return users;
}
