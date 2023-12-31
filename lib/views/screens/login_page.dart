
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/login_out_controllers.dart';
import '../../helper/firebaseauth_helper.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  LogINOutController logINOutController = Get.put(LogINOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login Now",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                onPressed: () async {
                  Map<String, dynamic> data = await FireBaseAuthHelper
                      .fireBaseAuthHelper
                      .signInWithGoogle();

                  if (data['user'] != null) {
                    Get.snackbar(
                      "SUCCESSFULLY",
                      "Login Successfully with Google😊..",
                      backgroundColor: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                    Get.offNamed('information_page', arguments: data['user']);
                    logINOutController.logInOutTrueValue();
                  } else {
                    Get.snackbar("FAILURE", data['msg'],
                        backgroundColor: Colors.red.shade200,);
                  }
                },
                icon: const Icon(Icons.g_mobiledata,color: Colors.blueAccent,),
                label: const Text("Sign in with google",style:  TextStyle(color: Colors.blueAccent),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
