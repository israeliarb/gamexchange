import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamexchange/auth/main_page.dart';
import 'package:gamexchange/constants/colors.dart';
import 'package:gamexchange/controllers/user_controller.dart';
import 'package:gamexchange/screens/game_form.dart';

//User currentUser = FirebaseAuth.instance.currentUser!;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Logado como: ${currentUser.email}'),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (contex) {
                  return MainPage();
                }),
              );
            },
            color: CustomColor.customBlue,
            child: const Text('Sair'),
          ),
          MaterialButton(
            onPressed: () {
              getUsers();
            },
            color: CustomColor.customBlue,
            child: const Text('User'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (contex) {
                  return GameForm();
                }),
              );
            },
            color: CustomColor.customBlue,
            child: const Text('Game'),
          )
        ],
      )),
    );
  }
}
