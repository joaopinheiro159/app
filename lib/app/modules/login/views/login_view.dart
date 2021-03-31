import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/klini_header.dart';
import 'package:klinimed_app/app/shared/widgets/klini_text_field.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cpfTextEditingController = TextEditingController();
  final senhaTextEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.backgroundColor,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              KliniHeader(),
              Container(
                width: Get.width * .80,
                child: Center(
                  child: Text(
                    'Informe abaixo o CPF cadastrado na adesão do plano Klini e sua senha de cadastro.',
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
                  controller: cpfTextEditingController,
                  label: 'CPF',
                  validator: (String value) {
                    if (value == null || value.isBlank || value.length != 11) {
                      return 'CPF inválido';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: Get.width * 0.80,
                child: Obx(
                  () => KliniTextField(
                    controller: senhaTextEditingController,
                    label: 'Senha',
                    obscureText: controller.obscureText,
                    suffixIcon: Icon(Icons.visibility),
                    suffixIconOnPressed: controller.showHidePassword,
                    validator: (String value) {
                      if (value == null || value.isBlank) {
                        return 'Senha inválida';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: Get.width * 0.80,
                child: KliniButton(
                  label: 'ENTRAR',
                  height: 60,
                  labelColor: MainTheme.backgroundColor,
                  buttonColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      controller.login(cpfTextEditingController.text,
                          senhaTextEditingController.text);
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width * 0.80,
                child: KliniButton(
                  label: 'PRIMEIRO ACESSO',
                  buttonColor: Color(0XFF7B9EB1),
                  height: 60,
                  labelColor: Colors.white,
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: Get.width * 0.80,
                child: KliniButton(
                  label: 'ESQUECI MINHA SENHA',
                  buttonColor: Color(0XFFF27E77),
                  height: 60,
                  labelColor: Colors.white,
                  onPressed: () {
                    Get.toNamed(Routes.FORGOT_PASSWORD);
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
      ),
    );
  }
}
