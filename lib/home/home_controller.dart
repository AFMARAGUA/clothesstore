import 'dart:convert';
import 'package:clothesstore/home/entities/item_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final Rx<Future<List>> _listItems = Future.value([]).obs;
  final Rx<Future<List>> _listItemsSearch = Future.value([]).obs;
  RxString _search = "".obs;
  final String url = "https://api.mercadolibre.com/sites/MCO/search";
  TextEditingController _controllerSearch;

  Future<List> get listItems => _listItems.value;
  Future<List> get listItemsSearch => _listItemsSearch.value;
  String get search => _search.value;
  TextEditingController get controllerSearch => _controllerSearch;

  @override
  void onInit() {
    _controllerSearch = TextEditingController();
    _getListItems();
    super.onInit();
  }

  _getListItems() {
    _listItems.value = _getListItemsCategory();
  }

  Future<List> _getListItemsCategory() async {
    List _listItems = [];
    var _url = Uri.parse('$url?category=MCO1648');
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var _jsonDecode = json.decode(utf8.decode(response.bodyBytes));
      _listItems = _jsonDecode["results"].map((m) => Item.fromJson(m)).toList();
    }
    return _listItems;
  }

  searchItems(String search) {
    _search.value = search;
    _listItemsSearch.value = _getSearchItems();
  }

  Future<List> _getSearchItems() async {
    List _listItems = [];
    var _url = Uri.parse('$url?q=${this.search}&category=MCO1430');
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var _jsonDecode = json.decode(utf8.decode(response.bodyBytes));
      _listItems = _jsonDecode["results"].map((m) => Item.fromJson(m)).toList();
    }
    return _listItems;
  }

  @override
  void onClose() {
    _controllerSearch.dispose();
    super.onClose();
  }
}
