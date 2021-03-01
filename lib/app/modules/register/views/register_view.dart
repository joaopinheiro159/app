import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/register/controllers/register_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/klini_header.dart';
import 'package:klinimed_app/app/shared/widgets/klini_text_field.dart';

class RegisterView extends GetView<RegisterController> {
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
                label: 'Data de Nascimento',
                suffixIcon: Icon(Icons.calendar_today_outlined),
                suffixIconOnPressed: () {
                  print('toggle');
                },
              ),
            ),
            Container(
              width: Get.width * 0.80,
              child: KliniTextField(
                label: 'Senha',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility),
                suffixIconOnPressed: () {
                  print('toggle');
                },
              ),
            ),
            Container(
              width: Get.width * 0.80,
              child: KliniTextField(
                label: 'Confirme a senha',
                obscureText: true,
                suffixIcon: Icon(Icons.visibility),
                suffixIconOnPressed: () {
                  print('toggle');
                },
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: Get.width * 0.80,
              child: KliniButton(
                label: 'CADASTRAR',
                height: 60,
                labelColor: MainTheme.backgroundColor,
                buttonColor: Colors.white,
                onPressed: () {},
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
