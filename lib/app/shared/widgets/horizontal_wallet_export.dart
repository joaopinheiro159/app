import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class HorizontalWalletExport extends StatelessWidget {
  final String nomeBeneficiario;
  final String numeroCarteira;
  final String plano;
  final String segmentacao;
  final String vigencia;

  const HorizontalWalletExport(
      {Key key,
      this.nomeBeneficiario,
      this.numeroCarteira,
      this.plano,
      this.segmentacao,
      this.vigencia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            this.nomeBeneficiario,
            style: TextStyle(
                color: MainTheme.backgroundColor,
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
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
                      this.numeroCarteira,
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Número da Carteirinha',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Text(
                      this.nomeBeneficiario,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'Nome',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Text(
                      this.plano,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'Plano',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Text(
                      this.segmentacao,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'Segmentação',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                    Text(
                      this.vigencia,
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                    Text(
                      'Início de Vigência',
                      style: TextStyle(color: Colors.white54, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
