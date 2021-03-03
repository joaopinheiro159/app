import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/klini_header.dart';

class ForgotPasswordResultView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            KliniHeader(),
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Senha enviada com sucesso para o email:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'email@email.com.br',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  KliniButton(
                    label: 'VOLTAR',
                    buttonColor: Color(0XFF7B9EB1),
                    labelColor: Colors.white,
                    width: Get.width * .8,
                    height: 60,
                    onPressed: () {
                      Get.offNamed(Routes.LOGIN);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
            ),
            Container(
              width: Get.width * 0.80,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Atendimento SAC:  0800-941-7920 / 3952-9191 www.klinimed.com.br',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
