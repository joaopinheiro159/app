import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/klini_header.dart';
import 'package:klinimed_app/app/shared/widgets/klini_text_field.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            KliniHeader(),
            Container(
              width: Get.width * .80,
              child: Center(
                child: Text(
                  'Informe abaixo os dados cadastrados na contratação do seu plano Klini.',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.80,
              child: KliniTextField(
                label: 'CPF',
              ),
            ),
            Container(
              width: Get.width * 0.80,
              child: KliniTextField(
                label: 'E-mail',
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: Get.width * 0.80,
              child: KliniButton(
                label: 'REENVIAR A SENHA',
                height: 60,
                labelColor: MainTheme.backgroundColor,
                buttonColor: Colors.white,
                onPressed: () {
                  Get.offNamed(Routes.FORGOT_PASSWORD_RESULT);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width * 0.80,
              child: KliniButton(
                label: 'VOLTAR',
                buttonColor: Color(0XFF7B9EB1),
                height: 60,
                labelColor: Colors.white,
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: Get.width * 0.80,
              child: Text(
                'Atendimento SAC:  0800-941-7920 / 3952-9191 www.klinimed.com.br',
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
