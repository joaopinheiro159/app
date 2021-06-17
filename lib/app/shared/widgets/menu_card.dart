import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Colors iconColor;
  const MenuCard({
    Key key,
    this.icon,
    this.title,
    this.description,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MainTheme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 110,
        width: Get.width * 0.9,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                icon,
                color: this.iconColor ?? Colors.white,
                size: 50,
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
