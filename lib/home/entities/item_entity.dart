class Item {
  Item({
    String id,
    String title,
    String thumbnail,
    num price,
  });

  String id, title, thumbnail;
  num price;

  Item.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.thumbnail = json["thumbnail"];
    this.price = json["price"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "thumbnail": this.thumbnail,
      "price": this.price,
    };
  }
}
