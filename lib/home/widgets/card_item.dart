import 'package:clothesstore/home/entities/item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardItem extends StatelessWidget {
  final Item item;
  const CardItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(2),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                FadeInImage(
                  image: NetworkImage(item.thumbnail),
                  placeholder: AssetImage('assets/images/loading.gif'),
                  fit: BoxFit.cover,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    item.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text('\$${item.price?.toString()}'),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(color: Color(0xff000000)),
                  padding: EdgeInsets.all(7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(color: Colors.transparent),
                        child: SvgPicture.asset(
                          'assets/images/icon-cart.svg',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Agregar al carrito',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
