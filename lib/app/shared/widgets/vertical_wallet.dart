import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class VerticalWallet extends StatelessWidget {
  final String nomeBeneficiario;
  final String numeroCarteira;
  final String plano;
  final String segmentacao;
  final String vigencia;

  const VerticalWallet(
      {Key key,
      this.nomeBeneficiario,
      this.numeroCarteira,
      this.plano,
      this.segmentacao,
      this.vigencia})
      : super(key: key);

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
                  height: 335,
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        this.numeroCarteira,
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
                        this.nomeBeneficiario,
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
                        this.plano,
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
                        this.segmentacao,
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
                        this.vigencia,
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
