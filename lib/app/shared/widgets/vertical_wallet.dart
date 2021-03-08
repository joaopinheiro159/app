import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class VerticalWallet extends StatelessWidget {
  const VerticalWallet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double labelSize = 18;
    final double descriptionSize = 19;

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Stack(
              children: [
                Image.asset(
                  'assets/carteirinha_verde.jpg',
                  height: 300,
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2020110020',
                        style: TextStyle(
                            color: Colors.white, fontSize: descriptionSize),
                      ),
                      Text(
                        'Número da Carteirinha',
                        style: TextStyle(
                            color: Colors.white54, fontSize: labelSize),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'MÁRCIO ANTÔNIO ROCHA DA CRUZ',
                        style: TextStyle(
                            color: Colors.white, fontSize: descriptionSize),
                      ),
                      Text(
                        'Nome',
                        style: TextStyle(
                            color: Colors.white54, fontSize: labelSize),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'KLINI FÁCIL PF',
                        style: TextStyle(
                            color: Colors.white, fontSize: descriptionSize),
                      ),
                      Text(
                        'Plano',
                        style: TextStyle(
                            color: Colors.white54, fontSize: labelSize),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Ambulatorial, Hospitalar com Obstetrícia',
                        style: TextStyle(
                            color: Colors.white, fontSize: descriptionSize),
                      ),
                      Text(
                        'Segmentação',
                        style: TextStyle(
                            color: Colors.white54, fontSize: labelSize),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '10/10/2020',
                        style: TextStyle(
                            color: Colors.white, fontSize: descriptionSize),
                      ),
                      Text(
                        'Início de Vigência',
                        style: TextStyle(
                            color: Colors.white54, fontSize: labelSize),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
