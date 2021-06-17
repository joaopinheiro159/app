import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/klini_header.dart';
import 'package:klinimed_app/app/shared/widgets/klini_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  textInputType: TextInputType.number,
                  maxLength: 11,
                  validator: (String value) {
                    if (value == null || value.isBlank || !value.isCpf) {
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
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(),
                  Container(),
                  GestureDetector(
                    onTap: () async {
                      final _url = 'https://www.facebook.com/klinisaude/';
                      await canLaunch(_url)
                          ? await launch(_url)
                          : throw 'Could not launch $_url';
                    },
                    child: Image.asset('assets/facebook.png'),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final _url = 'https://instagram.com/klinisaude/';
                      await canLaunch(_url)
                          ? await launch(_url)
                          : throw 'Could not launch $_url';
                    },
                    child: Image.asset('assets/instagram.png'),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final _url =
                          'https://www.linkedin.com/company/klini-saude/';
                      await canLaunch(_url)
                          ? await launch(_url)
                          : throw 'Could not launch $_url';
                    },
                    child: Image.asset('assets/linkedin.png'),
                  ),
                  Container(),
                  Container(),
                ],
              ),
              SizedBox(
                height: 30,
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
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
