import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String nick;
  final String cpf;
  final String phone;
  //TODO Implementar localização
  //double latitude;
  //double longitude;

  UserModel({
    required this.id,
    required this.name,
    required this.nick,
    required this.cpf,
    required this.phone,

    //required this.latitude,
    //required this.longitude,
  });
}
