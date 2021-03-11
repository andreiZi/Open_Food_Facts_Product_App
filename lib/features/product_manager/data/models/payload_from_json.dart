class Payload {
  int status;
  String statusVerbose;
  int barCode;
  Product product;

  Payload({this.status, this.statusVerbose, this.barCode, this.product});

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        status: json["status"] == null ? null : json["status"],
        statusVerbose:
            json["status_verbose"] == null ? null : json["status_verbose"],
        barCode:
            json["code"] is String ? int.parse(json["code"]) : json["code"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "status_verbose": statusVerbose == null ? null : statusVerbose,
        "code": barCode == null ? null : barCode,
        "product": product == null ? null : product.toJson(),
      };
}

class Product {
  String productName;
  List<String> storesTags;

  Product({
    this.productName,
    this.storesTags,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productName: json["product_name"] == null ? null : json["product_name"],
        storesTags: json["stores_tags"] == null
            ? null
            : List<String>.from(json['stores_tags']),
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName == null ? null : productName,
        "stores_tags": storesTags == null ? null : storesTags,
      };
}
