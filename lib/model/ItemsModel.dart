class APPModel {
  List<Items> items=[];

  APPModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
    //  items = <Items>[];
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

}

class Items {
  int ? itemId;
  String ? itemName;
  dynamic ? leId;
  dynamic ? priceitem;
  dynamic ? specialPrice;
  dynamic ? balance;
  dynamic ? Quantity;
  int ? inCart = 0;

Items({this.itemId,this.itemName,this.leId,this.priceitem,this.specialPrice,this.balance});
  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['ItemId'];
    itemName = json['ItemName'];
    leId = json['LeId'];
     priceitem = json['Priceitem'];
     specialPrice = json['SpecialPrice'];
    balance = json['Balance'];
    inCart = json['inCart'];
    Quantity = json['Quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ItemId'] = this.itemId;
    data['ItemName'] = this.itemName;
    data['LeId'] = this.leId;
    data['Priceitem'] = this.priceitem;
    data['SpecialPrice'] = this.specialPrice;
   // data['inCart'] = this.inCart;
    data['Balance'] = this.balance;
  //  data['Quantity'] = this.Quantity;
    return data;
  }

}



