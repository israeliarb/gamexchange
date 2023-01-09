import 'package:flutter/material.dart';
import 'package:gamexchange/constants/colors.dart';
import 'package:gamexchange/constants/custom_border_radius.dart';
import 'package:gamexchange/constants/font_size.dart';
import 'package:gamexchange/constants/custom_sizes.dart';
import 'package:gamexchange/constants/spacing_sizes.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.customLightGrey,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image(image: AssetImage('assets/icon/icon.png'), height: 150),
            const SizedBox(height: CustomSizes.size_75),
            //Hello again!
            const Text(
              'Olá novamente!',
              style: TextStyle(
                fontSize: FontSize.xxl,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: SpacingSizes.sm_10),

            const Text(
              'Bem vindo de volta, sentimos sua falta!',
              style: TextStyle(
                fontSize: FontSize.l,
              ),
            ),

            const SizedBox(height: SpacingSizes.l_32),

            //Email TextField
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColor.customGrey,
                  borderRadius: BorderRadius.circular(CustomBorderRadius.md_12),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: CustomSizes.size_20),
                  child: TextField(
                    style: TextStyle(color: CustomColor.customWhite),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: CustomColor.customWhite),
                      hintText: 'Email',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: SpacingSizes.sm_10),

            //Password TextField
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColor.customGrey,
                  borderRadius: BorderRadius.circular(CustomBorderRadius.md_12),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: CustomSizes.size_20),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: CustomColor.customWhite),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: CustomColor.customWhite),
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: SpacingSizes.sm_10),

            //Sign in button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: CustomSizes.size_25),
              child: Container(
                padding: const EdgeInsets.all(CustomSizes.size_15),
                decoration: BoxDecoration(
                    color: CustomColor.customBlue,
                    borderRadius:
                        BorderRadius.circular(CustomBorderRadius.md_12)),
                child: const Center(
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: CustomColor.customWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: FontSize.l,
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
                  'Não é um membro?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' Crie uma conta agora',
                  style: TextStyle(
                    color: CustomColor.customlightBlue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
