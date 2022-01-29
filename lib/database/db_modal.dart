class DBModal {
  late int id;
  late int proId;
  late String proName;
  late int proPrice;
  late int proQuantity;
  late int totalPrice;
  late String proImg;

  DBModal(this.id, this.proId, this.proName, this.proPrice, this.proQuantity,
      this.totalPrice, this.proImg);

  int get getId {
    return id;
  }

  int get getProid => proId;
  String get getProName => proName;
  int get getProPrice => proPrice;
  int get getProQuantity => proQuantity;
  int get getTotalPrice => totalPrice;
  String get getProImg => proImg;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (getId != null) {
      map['product_id'] = id;
    }
    map['name'] = proName;
    map['qty'] = proQuantity;
    map['sale_price'] = proPrice;
    map['amount'] = totalPrice;
    map['image_link'] = proImg;
    return map;
  }

  DBModal.map(dynamic obj) {
    this.id = obj['product_id'];
    this.proName = obj['name'];
    this.proQuantity = obj['qty'];
    this.proPrice = obj['sale_price'];
    this.totalPrice = obj['amount'];
    this.proImg = obj['image_link'];
  }

  DBModal.fromMapObject(Map<String, dynamic> map) {
    this.id = map['product_id'];
    this.proName = map['name'];
    this.proQuantity = map['qty'];
    this.proPrice = map['sale_price'];
    this.totalPrice = map['amount'];
    this.proImg = map['image_link'];
  }
}
