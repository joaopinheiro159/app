import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rx<MessageModel> message) {
    ever<MessageModel>(message, (model) async {
      if (model != null) {
        // Get.snackbar(model.title, model.message,
        //     backgroundColor: Colors.black54);

        Get.defaultDialog(
          title: model.title,
          titleStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          middleText: model.message,
          middleTextStyle: TextStyle(
            color: Colors.white,
          ),
          backgroundColor: Color(0XFFF37E77),
          radius: 20,
          textConfirm: 'OK',
          onConfirm: Get.back,
          confirmTextColor: Colors.red,
          buttonColor: Colors.white,
        );
      }
    });
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel(this.title, this.message, {this.type});
}

enum MessageType { error, info }

extension MessageTypeColorExt on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red[800];
      case MessageType.info:
        return Colors.blue[200];
      default:
        return Colors.black38;
    }
  }
}
