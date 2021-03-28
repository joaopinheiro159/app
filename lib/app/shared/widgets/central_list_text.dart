import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class CentralListText extends StatelessWidget {
  final String texto;

  const CentralListText({Key key, this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: MainTheme.backgroundColor,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              this.texto,
              style: TextStyle(
                color: Color(0XFF7B9EB1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
