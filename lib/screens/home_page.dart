import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gamexchange/constants/colors.dart';
import 'package:gamexchange/controllers/user_controller.dart';
import 'package:gamexchange/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Logado como: ${user.email}'),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
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
          )
        ],
      )),
    );
  }
}
