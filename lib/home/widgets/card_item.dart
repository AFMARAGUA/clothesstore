import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/getwidget.dart';

class CardItem extends StatelessWidget {
  final dynamic item;
  const CardItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFCard(
      image: Image.network(
        item["thumbnail"],
        width: 100,
        height: 100,
      ),
      showImage: true,
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
      content: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(item["title"]),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '\$${item["price"]?.toString()}',
            )
          ],
        ),
      ),
      buttonBar: GFButtonBar(
        alignment: WrapAlignment.center,
        children: [
          GFButton(
            color: Color(0xff000000),
            onPressed: () {},
            icon: Container(
              height: 15.0,
              width: 15.0,
              decoration: BoxDecoration(color: Colors.transparent),
              child: SvgPicture.asset(
                'assets/images/icon-cart.svg',
                color: Colors.white,
              ),
            ),
            text: 'Agregar al carrito',
          ),
        ],
      ),
    );
  }
}
