import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:klinimed_app/app/modules/register/controllers/register_controller.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';
import 'package:klinimed_app/app/shared/widgets/klini_button.dart';
import 'package:klinimed_app/app/shared/widgets/klini_header.dart';
import 'package:klinimed_app/app/shared/widgets/klini_text_field.dart';
import 'package:klinimed_app/app/shared/widgets/klini_text_picker_field.dart';

class RegisterView extends GetView<RegisterController> {
  final formKey = GlobalKey<FormState>();
  final cpfTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

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
                child: KliniTextPickerField(
                  label: 'Data de Nascimento',
                  controller: controller.birthDateTextEditingController,
                  suffixIcon: Icon(Icons.calendar_today_outlined),
                  validator: (String value) {
                    if (value == null || value.isBlank) {
                      return 'Data inválida';
                    }
                    return null;
                  },
                  suffixIconOnPressed: () async {
                    DateTime picked = await showDatePicker(
                      context: context,
                      initialDate: new DateTime.now(),
                      firstDate: new DateTime(1900),
                      lastDate: new DateTime.now(),
                      builder: (context, Widget child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            primaryColor: MainTheme.backgroundColor,
                            accentColor: const Color(0xFF8CE7F1),
                            colorScheme: ColorScheme.light(
                              primary: MainTheme.backgroundColor,
                            ),
                            buttonTheme: ButtonThemeData(
                              textTheme: ButtonTextTheme.primary,
                            ),
                          ),
                          child: child,
                        );
                      },
                    );
                    if (picked != null) {
                      DateFormat dateFormat = DateFormat("dd-MM-yyyy");
                      controller.birthDateTextEditingController.text =
                          dateFormat.format(picked);
                    }
                  },
                ),
              ),
              Container(
                width: Get.width * 0.80,
                child: KliniTextField(
                  label: 'Senha',
                  controller: passwordTextEditingController,
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility),
                  validator: (String value) {
                    if (value == null || value.isBlank) {
                      return 'Senha inválida';
                    }
                    return null;
                  },
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
                  validator: (String value) {
                    if (value == null || value.isBlank) {
                      return 'Senha inválida';
                    }
                    return null;
                  },
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
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      controller.register(
                          cpfTextEditingController.text,
                          passwordTextEditingController.text,
                          controller.birthDateTextEditingController.text);
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
