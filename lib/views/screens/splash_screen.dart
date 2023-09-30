
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/introscreen_controller.dart';
import '../../controllers/login_out_controllers.dart';
import '../../helper/firebaseauth_helper.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  User? user = Get.arguments as User?;

  IntroAccessController introAccessController =
      Get.put(IntroAccessController());
  LogINOutController logINOutController = Get.put(LogINOutController());

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 5)).then(
      (value) => (introAccessController.introAccess_Model.introaccess)
          ? (logINOutController.loginInOutModel.islogin)
              ? Get.offAndToNamed(
                  '/',
                  arguments: FireBaseAuthHelper.firebaseAuth.currentUser,
                )
              : Get.offAndToNamed(
                  '/information_page',
                  arguments: FireBaseAuthHelper.firebaseAuth.currentUser,
                )
          : Get.offAllNamed('/login_page',
              arguments: introAccessController.introAccessControllerTrueValue(
                  val: true)),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 400,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/vote.png"),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
