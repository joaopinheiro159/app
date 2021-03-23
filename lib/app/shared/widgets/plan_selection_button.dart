import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/routes/app_pages.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class PlanSelectionButton extends StatelessWidget {
  final String nomePlano;
  final String codBeneficiario;

  const PlanSelectionButton({Key key, this.nomePlano, this.codBeneficiario})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width * 0.80,
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(Routes.MENU,
                  parameters: {"codbeneficiario": codBeneficiario});
            },
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  nomePlano.contains('DENTAL')
                      ? FontAwesomeIcons.tooth
                      : FontAwesomeIcons.heartbeat,
                  color: MainTheme.backgroundColor,
                ),
                Text(
                  '$nomePlano - $codBeneficiario',
                  style: TextStyle(
                      color: MainTheme.backgroundColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
                Icon(
                  Icons.check_circle_rounded,
                  color: MainTheme.backgroundColor,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
