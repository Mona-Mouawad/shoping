class SOItem {
  List<SOItem_Model> items=[];

  SOItem.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      //  items = <SOItem_Model>[];
      json['items'].forEach((v) {
        items.add(new SOItem_Model.fromJson(v));
      });
    }
  }

}


class SOItem_Model {
  int ? SOItemId;
  int ? ItemId;
  dynamic ? leId;
  dynamic ? Price;
  dynamic ? CustVenName;
  dynamic ? CustPhone;
  dynamic ? status ;
  dynamic ? ItemName;
  dynamic ? Total;
  dynamic ? Quantity;
  dynamic ? SalesOrderId;

  SOItem_Model({this.SOItemId,this.ItemId,this.leId,this.Price,this.CustVenName,this.CustPhone});

  SOItem_Model.fromJson(Map<String, dynamic> json) {
    SOItemId = json['SOItemId'];
    ItemId = json['ItemId'];
    leId = json['LeId'];
    Price = json['Price'];
    CustVenName = json['CustVenName'];
    CustPhone = json['CustPhone'];
    Quantity = json['Quantity'];
    Total = json['Total'];
    ItemName = json['ItemName'];
    status = json['status'];
    SalesOrderId = json['SalesOrderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SOItemId'] = this.SOItemId;
    data['ItemId'] = this.ItemId;
    data['LeId'] = this.leId;
    data['Quantity'] = this.Quantity;
    data['Total'] = this.Total;
    data['ItemName'] = this.ItemName;
    data['Price'] = this.Price;
    data['CustVenName'] = this.CustVenName;
    data['CustPhone'] = this.CustPhone;
    data['SalesOrderId'] = this.SalesOrderId;
    return data;
  }

}



