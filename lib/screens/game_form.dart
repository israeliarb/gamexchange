import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamexchange/constants/colors.dart';
import 'package:gamexchange/constants/custom_border_radius.dart';
import 'package:gamexchange/constants/custom_sizes.dart';
import 'package:gamexchange/constants/font_size.dart';
import 'package:gamexchange/constants/spacing_sizes.dart';
import 'package:gamexchange/controllers/game_controller.dart';
import 'package:gamexchange/screens/home_page.dart';
import 'package:image_picker/image_picker.dart';

final plat = {'Xbox 360', 'Xbox One', 'Xbox Series', 'Ps3', 'Ps4', 'Ps5'};
final xchange = {'Troca', 'Venda', 'Empréstimo'};

class GameForm extends StatefulWidget {
  const GameForm({super.key});

  @override
  State<GameForm> createState() => _GameFormState();
}

class _GameFormState extends State<GameForm> {
  final String _ownerId = FirebaseAuth.instance.currentUser!.uid;

  //Text controllers
  final _nameController = TextEditingController();
  String _plataformController = '';
  String _xchangeTypeController = '';
  String _preservationStateController = '';
  bool _isActiveController = false;
  //final _ownerId = currentUser.uid;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.customBlack,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                'Cadastre seu jogo abaixo',
                style: TextStyle(
                  fontSize: FontSize.xl,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: SpacingSizes.l_32),

              //Name TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: TextField(
                  controller: _nameController,
                  style: const TextStyle(color: CustomColor.customWhite),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColor.customLightGrey),
                      borderRadius:
                          BorderRadius.circular(CustomBorderRadius.md_12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColor.customBlue),
                      borderRadius:
                          BorderRadius.circular(CustomBorderRadius.md_12),
                    ),
                    hintStyle: const TextStyle(color: CustomColor.customWhite),
                    hintText: 'Nome do jogo',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Plataform TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: DropdownButtonFormField(
                  menuMaxHeight: CustomSizes.size_200,
                  borderRadius: BorderRadius.circular(CustomBorderRadius.md_12),
                  style: const TextStyle(color: CustomColor.customWhite),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColor.customLightGrey),
                      borderRadius:
                          BorderRadius.circular(CustomBorderRadius.md_12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColor.customBlue),
                      borderRadius:
                          BorderRadius.circular(CustomBorderRadius.md_12),
                    ),
                    hintStyle: const TextStyle(color: CustomColor.customWhite),
                    hintText: 'Plataforma do jogo',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                  items: plat.map((String dropdownItem) {
                    return DropdownMenuItem(
                      value: dropdownItem,
                      child: Text(dropdownItem),
                    );
                  }).toList(),
                  onChanged: (Object? value) {
                    _plataformController = value.toString();
                  },
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //XchangeType TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(CustomBorderRadius.md_12),
                  style: const TextStyle(color: CustomColor.customWhite),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColor.customLightGrey),
                      borderRadius:
                          BorderRadius.circular(CustomBorderRadius.md_12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColor.customBlue),
                      borderRadius:
                          BorderRadius.circular(CustomBorderRadius.md_12),
                    ),
                    hintStyle: const TextStyle(color: CustomColor.customWhite),
                    hintText: 'Tipo de xchange',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                  items: xchange.map((String dropdownItem) {
                    return DropdownMenuItem(
                      value: dropdownItem,
                      child: Text(dropdownItem),
                    );
                  }).toList(),
                  onChanged: (Object? value) {
                    _xchangeTypeController = value.toString();
                  },
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Preservation State TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: DropdownButtonFormField(
                  borderRadius: BorderRadius.circular(CustomBorderRadius.md_12),
                  style: const TextStyle(color: CustomColor.customWhite),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColor.customLightGrey),
                      borderRadius:
                          BorderRadius.circular(CustomBorderRadius.md_12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: CustomColor.customBlue),
                      borderRadius:
                          BorderRadius.circular(CustomBorderRadius.md_12),
                    ),
                    hintStyle: const TextStyle(color: CustomColor.customWhite),
                    hintText: 'Estado de conservação',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                  items: const [
                    DropdownMenuItem(
                      child: Text('Novo'),
                      value: 'Novo',
                    ),
                    DropdownMenuItem(
                      child: Text('Seminovo'),
                      value: 'Seminovo',
                    ),
                    DropdownMenuItem(
                      child: Text('Usado'),
                      value: 'Usado',
                    ),
                  ],
                  onChanged: (Object? value) {
                    _preservationStateController = value.toString();
                  },
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Switch
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Disponibilidade',
                      style: TextStyle(
                        color: CustomColor.customWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.l,
                      ),
                    ),
                    Switch(
                      value: _isActiveController,
                      onChanged: ((value) {
                        setState(() {
                          _isActiveController = value;
                        });
                      }),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Photo
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Anexar imagem',
                      style: TextStyle(
                        color: CustomColor.customWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: FontSize.l,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        selectImage();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(CustomSizes.size_15),
                        decoration: BoxDecoration(
                            color: CustomColor.customBlack,
                            borderRadius: BorderRadius.circular(
                                CustomBorderRadius.md_12)),
                        child: const Center(
                          child: Icon(Icons.image),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Confirm in button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: GestureDetector(
                  onTap: () {
                    addGame(
                      _ownerId.trim(),
                      _nameController.text.trim(),
                      _plataformController,
                      _xchangeTypeController,
                      _preservationStateController,
                      _isActiveController,
                    ).then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (contex) {
                          return const HomePage();
                        }),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(CustomSizes.size_15),
                    decoration: BoxDecoration(
                        color: CustomColor.customBlue,
                        borderRadius:
                            BorderRadius.circular(CustomBorderRadius.md_12)),
                    child: const Center(
                      child: Text(
                        'Cadastrar',
                        style: TextStyle(
                          color: CustomColor.customWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.l,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Cancel in button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (contex) {
                        return const HomePage();
                      }),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(CustomSizes.size_15),
                    decoration: BoxDecoration(
                        color: CustomColor.customRed,
                        borderRadius:
                            BorderRadius.circular(CustomBorderRadius.md_12)),
                    child: const Center(
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: CustomColor.customWhite,
                          fontWeight: FontWeight.bold,
                          fontSize: FontSize.l,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.l_32),
            ]),
          ),
        ),
      ),
    );
  }
}
