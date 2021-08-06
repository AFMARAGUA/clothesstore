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

  _infoData({
    EdgeInsetsGeometry padding,
    @required message,
    bool statusError = false,
  }) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding ?? Get.height * 0.25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              child: SvgPicture.asset(
                'assets/images/${statusError ? "undraw_error.svg" : "undraw_empty.svg"}',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "$message",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Container(
        margin: EdgeInsets.only(top: Get.height * 0.020),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              title: Container(
                margin: EdgeInsets.only(left: Get.height * 0.035),
                height: 200.0,
                width: 200.0,
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  color: Colors.black,
                ),
              ),
              leading: Container(
                margin: EdgeInsets.only(left: Get.height * 0.020),
                height: 10.0,
                width: 10.0,
                child: SvgPicture.asset(
                  'assets/images/icon-menu.svg',
                  color: Colors.black,
                ),
              ),
              actions: [
                Container(
                  margin: EdgeInsets.only(right: Get.height * 0.020),
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
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Search.textFormField(
                    textInputAction: TextInputAction.search,
                    controller: controller.controllerSearch,
                    decoration: InputDecoration(
                      fillColor: Color(0xffeeeeee),
                      filled: true,
                      hoverColor: Colors.black,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintText: 'Busca el producto aquí...',
                      suffixIcon: Container(
                        decoration: new BoxDecoration(
                          color: Color(0xff6b6b6b).withOpacity(0.5),
                        ),
                        child: IconButton(
                          onPressed: () => controller
                              .searchItems(controller.controllerSearch.text),
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
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
                          width: double.infinity,
                          child: FutureBuilder(
                            future: controller.listItemsSearch,
                            builder: (BuildContext context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data.length == 0) {
                                  return _infoData(
                                      message: 'Datos no encontrados...');
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
                                return _infoData(
                                  message: snapshot.error,
                                  statusError: true,
                                );
                              }
                              return Container(
                                margin: EdgeInsets.only(top: Get.height * .150),
                                child: Image.asset(
                                  "assets/images/loading.gif",
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
                                        height: Get.height * .28,
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        viewportFraction: 0.5,
                                      ),
                                      items: snapshot.data
                                          .map((item) => CardItem(item: item))
                                          .toList(),
                                    ),
                                  );
                                } else if (snapshot.hasError) {
                                  return _infoData(
                                    message: snapshot.error,
                                    statusError: true,
                                    padding: EdgeInsets.symmetric(
                                        vertical: Get.height * .05),
                                  );
                                }
                                return Container(
                                  child: Image.asset(
                                    "assets/images/loading.gif",
                                    height: 100.0,
                                    width: 100.0,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      footer(),
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
