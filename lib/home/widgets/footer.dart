import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget footer() {
  return Container(
    padding: EdgeInsets.all(50.0),
    decoration: BoxDecoration(
      color: Color(0xff000000),
    ),
    child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'SÍGUENOS EN:',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: 30.0,
              width: 30.0,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white),
              child: SvgPicture.asset(
                'assets/images/icon-facebook.svg',
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 30.0,
              width: 30.0,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white),
              child: SvgPicture.asset(
                'assets/images/icon-twitter.svg',
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 30.0,
              width: 30.0,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white),
              child: SvgPicture.asset(
                'assets/images/icon-instagram.svg',
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              height: 30.0,
              width: 30.0,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.white),
              child: SvgPicture.asset(
                'assets/images/icon-youtube.svg',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 60.0,
        ),
        Text(
          '© Copyright Colombia. Todos los derechos reservados',
          style: TextStyle(color: Colors.white, fontSize: 11.0),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    ),
  );
}
