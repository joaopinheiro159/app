import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class HorizontalWallet extends StatelessWidget {
  const HorizontalWallet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Image.asset(
                'assets/carteirinha_verde.jpg',
                height: 180,
              ),
              Positioned(
                left: 8,
                top: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2020110020',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Número da Carteirinha',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Text(
                      'MÁRCIO ANTÔNIO ROCHA DA CRUZ',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'Nome',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Text(
                      'KLINI FÁCIL PF',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'Plano',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Text(
                      'Ambulatorial, Hospitalar com Obstetrícia',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'Segmentação',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Text(
                      '10/10/2020',
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'Início de Vigência',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Color(0X55000000),
                    radius: 30,
                    child: Icon(
                      FontAwesomeIcons.searchPlus,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
