import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:klinimed_app/app/shared/theme/main_theme.dart';

class BoletoCard extends StatelessWidget {
  const BoletoCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Color(0xFFF5F5F5),
      child: Container(
        height: 110,
        width: Get.width * 0.9,
        child: Stack(
          children: [
            Container(
              height: 110,
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: MainTheme.backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 7.0),
                    child: Text(
                      'Clique para ver todos os boletos',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 75,
              padding: EdgeInsets.only(left: 20),
              width: Get.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0XFFF0F0F0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Maio/2021',
                        style: TextStyle(
                            fontSize: 17,
                            color: Color(0XFF7B9EB1),
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'R\$ 263,00',
                        style: TextStyle(
                            fontSize: 17,
                            color: MainTheme.backgroundColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    'NÃO PAGO',
                    style: TextStyle(
                        color: MainTheme.backgroundColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: 130,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        onPressed: () {},
                        height: 45,
                        color: MainTheme.backgroundColor,
                        child: Text(
                          '+ detalhes',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
