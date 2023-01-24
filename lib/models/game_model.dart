import 'package:cloud_firestore/cloud_firestore.dart';

class GameModel {
  //final String id;
  final String ownerId;
  final String name;
  final String plataform;
  final String xchangeType;
  final String preservationState;
  bool isActive;
  String? imageUrl;

  GameModel({
    //required this.id,
    required this.ownerId,
    required this.name,
    required this.plataform,
    required this.xchangeType,
    required this.preservationState,
    required this.isActive,
    this.imageUrl,
  });

  factory GameModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return GameModel(
      //id: data?['id'],
      ownerId: data?['ownerId'],
      name: data?['name'],
      plataform: data?['plataform'],
      xchangeType: data?['xchangeType'],
      preservationState: data?['preservationState'],
      isActive: data?['isActive'],
      imageUrl: data?['imageUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'ownerId': ownerId,
      'name': name,
      'plataform': plataform,
      'xchangeType': xchangeType,
      'preservationState': preservationState,
      'isActive': isActive,
      'imageUrl': imageUrl,
    };
  }
}
