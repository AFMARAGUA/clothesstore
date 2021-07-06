import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final Rx<Future<List>> _listItems = Future.value([]).obs;
  final Rx<Future<List>> _listItemsSearch = Future.value([]).obs;
  RxString _search = "".obs;
  final String url = "https://api.mercadolibre.com/sites/MCO/search";

  Future<List> get listItems => _listItems.value;
  Future<List> get listItemsSearch => _listItemsSearch.value;
  String get search => _search.value;

  @override
  void onInit() {
    _getListItems();
    super.onInit();
  }

  _getListItems() {
    this._listItems.value = _getListItemsCategory();
  }

  Future<List> _getListItemsCategory() async {
    List<dynamic> _listItems = [];
    var _url = Uri.parse('$url?category=MCO1648');
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var _jsonDecode = json.decode(utf8.decode(response.bodyBytes));
      _listItems = _jsonDecode["results"];
    }
    return _listItems;
  }

  searchItems(String search) {
    this._search.value = search;
    this._listItemsSearch.value = _getSearchItems();
  }

  Future<List> _getSearchItems() async {
    List<dynamic> _listItems = [];
    var _url = Uri.parse('$url?q=${this.search}&category=MCO1430');
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var _jsonDecode = json.decode(utf8.decode(response.bodyBytes));
      _listItems = _jsonDecode["results"];
    }
    return _listItems;
  }
}
