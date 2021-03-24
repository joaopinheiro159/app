import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/change_password/controllers/change_password_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/klini_header.dart';
import 'package:klinimed_app/app/shared/widgets/klini_text_field.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  final cpfTextEditingController = TextEditingController();
  final currentPasswordTextEditingController = TextEditingController();
  final newPasswordTextEditingController = TextEditingController();
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
                    'Informe abaixo o seu CPF, sua senha atual e sua nova senha.',
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
                  controller: cpfTextEditingController,
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
                    label: 'Senha atual',
                    obscureText: controller.obscureTextCurrentPassword,
                    suffixIcon: Icon(Icons.visibility),
                    suffixIconOnPressed: controller.showHideCurrentPassword,
                    controller: currentPasswordTextEditingController,
                    validator: (String value) {
                      if (value == null || value.isBlank) {
                        return 'Senha inválida';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.80,
                child: Obx(
                  () => KliniTextField(
                    label: 'Nova senha',
                    obscureText: controller.obscureTextNewPassword,
                    suffixIcon: Icon(Icons.visibility),
                    suffixIconOnPressed: controller.showHideNewPassword,
                    controller: newPasswordTextEditingController,
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
                  label: 'ALTERAR',
                  height: 60,
                  labelColor: MainTheme.backgroundColor,
                  buttonColor: Colors.white,
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      controller.changePassword(
                          cpfTextEditingController.text,
                          currentPasswordTextEditingController.text,
                          newPasswordTextEditingController.text);
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
      ),
    );
  }
}
