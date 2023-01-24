import 'dart:io';
import 'package:gamexchange/main.dart';
import 'package:gamexchange/models/game_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

String gameId = '';
final ImagePicker _imagePicker = ImagePicker();
XFile? image;

Future addGame(
  String ownerId,
  String name,
  String plataform,
  String xchangeType,
  String preservationState,
  bool isActive,
) async {
  GameModel newGame = GameModel(
    ownerId: ownerId,
    name: name,
    plataform: plataform,
    xchangeType: xchangeType,
    preservationState: preservationState,
    isActive: isActive,
  );

  //Add game to firestore via converter declared on model

  final docRef = db.collection('games').withConverter(
        fromFirestore: GameModel.fromFirestore,
        toFirestore: (GameModel newGame, options) => newGame.toFirestore(),
      );

  await docRef
      .add(newGame)
      .then((documentSnapshot) => gameId = documentSnapshot.id);

  uploadImage(image!);
}

Future<void> selectImage() async {
  var status = await Permission.storage.request();
  var compress;
  if (status.isGranted) {
    image = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: compress);
  }
}

Future<void> uploadImage(XFile image) async {
  //Create reference foi firebase storage
  final docRef = db.collection('images').doc(gameId);
  File imageFile = File(image.path);
  Reference reference = fb.ref(imageFile.toString());

  //Upload image from galery
  try {
    UploadTask uploadTask = reference.putFile(imageFile);

    final storageSnapshot = uploadTask.snapshot;

    final imageUrl = await storageSnapshot.ref.getDownloadURL();

    await docRef.update({'imageUrl': imageUrl});
  } on FirebaseException catch (e) {
    throw Exception('Erro no upload: ${e.code}');
  }
}
