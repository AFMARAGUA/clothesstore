import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'home_controller.dart';
import 'widgets/card_item.dart';
import 'widgets/footer.dart';
import 'widgets/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  static final String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Container(
        margin: EdgeInsets.only(top: 15.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              title: Container(
                margin: EdgeInsets.only(left: 10.0),
                height: 200.0,
                width: 200.0,
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  color: Colors.black,
                ),
              ),
              leading: Container(
                margin: EdgeInsets.only(left: 20.0),
                height: 10.0,
                width: 10.0,
                child: SvgPicture.asset(
                  'assets/images/icon-menu.svg',
                  color: Colors.black,
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  height: 30.0,
                  width: 30.0,
                  child: SvgPicture.asset(
                    'assets/images/icon-cart.svg',
                    color: Colors.black,
                  ),
                ),
              ],
              pinned: true,
              backgroundColor: Color(0xffffffff),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Get.height * 0.050),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Search.textFormField(
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      fillColor: Color(0xffeeeeee),
                      filled: true,
                      hintText: 'Buscar aquí producto',
                      suffixIcon: Container(
                        decoration: new BoxDecoration(
                          color: Color(0xff6b6b6b).withOpacity(0.5),
                        ),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (search) =>
                        controller.searchItems(search),
                  ),
                ),
              ),
            ),
            Obx(
              () {
                if (controller.search.isNotEmpty) {
                  return SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          child: FutureBuilder(
                            future: controller.listItemsSearch,
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.length == 0) {
                                  return Container(
                                    height: Get.height * 0.3,
                                    child: Center(
                                      heightFactor: 3.0,
                                      child: Text(
                                        'Data not found...',
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  child: Column(
                                    children: snapshot.data.map<Widget>((item) {
                                      return CardItem(
                                        item: item,
                                      );
                                    }).toList(),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Container(
                                  height: Get.height * 0.3,
                                  child: Center(
                                    heightFactor: 3.0,
                                    child: Text(
                                      "${snapshot.error}",
                                    ),
                                  ),
                                );
                              }
                              return Container(
                                height: Get.height * 0.3,
                                child: Center(
                                  heightFactor: 3.0,
                                  child: Text(
                                    'Loading data...',
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        child: Image.asset(
                            "assets/images/banner-principal-mobile.jpg"),
                      ),
                      Container(
                        margin: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                  "assets/images/banner-moda-infantil.jpg"),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              child: Image.asset(
                                  "assets/images/banner-deportivo.jpg"),
                            ),
                            FutureBuilder<List>(
                              future: controller.listItems,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    child: CarouselSlider(
                                      options: CarouselOptions(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .45,
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        viewportFraction: 0.7,
                                        enlargeCenterPage: true,
                                      ),
                                      items: snapshot.data
                                          .map((item) => CardItem(item: item))
                                          .toList(),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return Container(
                                    height: Get.height * 0.3,
                                    child: Center(
                                      heightFactor: 3.0,
                                      child: Text(
                                        "${snapshot.error}",
                                      ),
                                    ),
                                  );
                                }
                                return Container(
                                  height: Get.height * 0.3,
                                  child: Center(
                                    heightFactor: 3.0,
                                    child: Text(
                                      'Loading data...',
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      footer()
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
