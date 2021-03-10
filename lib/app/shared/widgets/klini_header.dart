import 'package:flutter/material.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

import 'custom_shape.dart';

class KliniHeader extends StatelessWidget {
  const KliniHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipBehavior: Clip.antiAlias,
          clipper: CustomShape(),
          child: Container(
            height: 305,
            color: Colors.white,
          ),
        ),
        ClipPath(
          clipper: CustomShape(),
          child: Container(
            height: 295,
            color: MainTheme.backgroundColor,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Image.asset(
                  'assets/klini_area_cliente.png',
                  height: 90,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
