import 'dart:io';
import 'package:gamexchange/main.dart';
import 'package:gamexchange/models/game_model.dart';
import 'package:gamexchange/models/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:permission_handler/permission_handler.dart';

String gameId = '';
final ImagePicker _imagePicker = ImagePicker();
XFile? image;
final docRef = db.collection('games').withConverter(
      fromFirestore: GameModel.fromFirestore,
      toFirestore: (GameModel newGame, options) => newGame.toFirestore(),
    );

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
  await docRef
      .add(newGame)
      .then((documentSnapshot) => gameId = documentSnapshot.id);

  uploadImage(image!);
}

Future<void> selectImage() async {
  var status = await Permission.storage.request();
  const compress = 30;
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

//Get my game list
Future<void> getMyGames(String userId) async {
  final docSnap = await docRef.get();
  final List<GameModel> myGames = [];
  for (var doc in docSnap.docs) {
    if (doc['ownerId'] == userId) {
      myGames.add(
        GameModel(
          ownerId: doc['ownerId'],
          name: doc['name'],
          plataform: doc['plataform'],
          xchangeType: doc['xchangeType'],
          preservationState: doc['preservationState'],
          isActive: doc['isActive'],
          imageUrl: doc['imageUrl'],
        ),
      );
    }
  }
  print(myGames);
}

//Get game list
Future<void> getGameList(String userId) async {
  final docSnap = await docRef.get();
  final List<GameModel> gameList = [];
  for (var doc in docSnap.docs) {
    if (doc['ownerId'] != userId) {
      gameList.add(
        GameModel(
          ownerId: doc['ownerId'],
          name: doc['name'],
          plataform: doc['plataform'],
          xchangeType: doc['xchangeType'],
          preservationState: doc['preservationState'],
          isActive: doc['isActive'],
          imageUrl: doc['imageUrl'],
        ),
      );
    }
  }
  print(gameList);
}
