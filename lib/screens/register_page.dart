import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamexchange/constants/colors.dart';
import 'package:gamexchange/constants/custom_border_radius.dart';
import 'package:gamexchange/constants/custom_sizes.dart';
import 'package:gamexchange/constants/font_size.dart';
import 'package:gamexchange/constants/spacing_sizes.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cpfController = TextEditingController();
  final _nameController = TextEditingController();
  final _nickController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _phoneController.dispose();
    _cpfController.dispose();
    _nameController.dispose();
    _nickController.dispose();
    super.dispose();
  }

  Future signUp() async {
    //Create user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      //Add user details
      addUserDetails(
        _nameController.text.trim(),
        _nickController.text.trim(),
        _cpfController.text.trim(),
        _phoneController.text.trim(),
      );
    }
  }

  Future addUserDetails(
      String name, String nick, String cpf, String phone) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': name,
      'nick': nick,
      'cpf': cpf,
      'phone': phone,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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
              const SizedBox(height: SpacingSizes.sm_10),
              //Hello again!
              const Text(
                'Bem vindo',
                style: TextStyle(
                  fontSize: FontSize.xxl,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              const Text(
                'Faça seu cadastro abaixo',
                style: TextStyle(
                  fontSize: FontSize.l,
                ),
              ),

              const SizedBox(height: SpacingSizes.md_16),

              //Email TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: TextField(
                  controller: _emailController,
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
                    hintText: 'Email',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

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
                    hintText: 'Nome',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Nick TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: TextField(
                  controller: _nickController,
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
                    hintText: 'User',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //CPF TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: TextField(
                  controller: _cpfController,
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
                    hintText: 'CPF',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Phone TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: TextField(
                  controller: _phoneController,
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
                    hintText: 'Telefone',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Password TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
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
                    hintText: 'Password',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Confirm Password TextField
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: TextField(
                  controller: _confirmpasswordController,
                  obscureText: true,
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
                    hintText: 'Confirm Password',
                    filled: true,
                    fillColor: CustomColor.customDarkGrey,
                  ),
                ),
              ),

              const SizedBox(height: SpacingSizes.sm_10),

              //Sign in button
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
                child: GestureDetector(
                  onTap: signUp,
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

              const SizedBox(height: SpacingSizes.l_32),

              //Not a member? Register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Já possui uma conta?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      ' Entre agora',
                      style: TextStyle(
                        color: CustomColor.customlightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
